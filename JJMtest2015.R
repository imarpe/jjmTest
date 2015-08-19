# validation test for new multistock JJM (2015 version)
require(jjmTools)

# Configuration 2014
runJJM("model2014", path="config", input="input", exec="jjm2014")
mod2014 = readJJM("model2014", path="config", input="input", version="2014")
s1 = summary(mod2014)$like

a = plot(mod2014, what = "biomass", main = "Total Biomass")
b = plot(mod2014, what = "noFishTB", main = "Unfished Biomass")
c = plot(mod2014, what = "ssb", main = "Spawning Biomass")
d = plot(mod2014, what = "ftot", main = "Fishing mortality")


#Configuration 2015 (multistock)
runJJM("model2014ms", path="config", input="input", exec="jjm2015")
mod2014ms = readJJM("model2014ms",  path="config", input="input")
s2 = summary(mod2014ms)$like

A = plot(mod2014ms, what = "biomass", main = "")
B = plot(mod2014ms, what = "noFishTB", main = "")
C = plot(mod2014ms, what = "ssb", main = "")
D = plot(mod2014ms, what = "ftot", main = "")

#Comparison
grid.arrange(a, A, b, B, c, C, d, D, ncol = 2)
merge(s1,s2, by = "row.names")

#Rmarkdown
render("JJMtest2015.Rmd", output_dir="report")

#Reports
report(mod2014)
report(mod2014ms)
