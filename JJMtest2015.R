# validation test for new multistock JJM (2015 version)
require(jjmTools)

# Configuration 2014
#runJJM("model2014", path="config", input="input", exec="jjm2014.exe")
mod2014 = readJJM("model2014", path="config", input="input", version="2014")
summary(mod2014)$like
a = plot(mod2014, what = "biomass", main = "Total Biomass")
b = plot(mod2014, what = "noFishTB", main = "Unfished Biomass")
c = plot(mod2014, what = "ssb", main = "Spawning Biomass")
d = plot(mod2014, what = "ftot", main = "Fishing mortality")


#Configuration 2015 (multistock)
#runJJM("model2014ms", path="config", input="input", exec="jjm2015.exe")
mod2014ms = readJJM("model2014ms",  path="config", input="input")
summary(mod2014ms)$like
A = plot(mod2014ms, what = "biomass", main = "")
B = plot(mod2014ms, what = "noFishTB", main = "")
C = plot(mod2014ms, what = "ssb", main = "")
D = plot(mod2014ms, what = "ftot", main = "")

#Comparison
grid.arrange(a, A, b, B, c, C, d, D, ncol = 2)

# report(diag2014)
# report(diag2014ms)

render("JJMtest2015.Rmd", output_dir="reports")

