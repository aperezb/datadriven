library("ggplot2")
# now we can use functions exported by this package

if (!file.exists("db")) {
  exploitdb_url <- "https://raw.githubusercontent.com/offensive-security/exploit-database/master/files.csv"
  download.file(exploitdb_url, destfile = "db")
}
db <- read.csv("./db", header = T)
db_aggr <- dplyr::count(db, platform, sort = T)
ggplot(db_aggr, aes(x = "", y = n, fill = platform)) + geom_bar(width = 1, stat = "identity")

