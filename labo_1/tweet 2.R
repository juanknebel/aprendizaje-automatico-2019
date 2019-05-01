
library("twitteR")
library("ROAuth")
setup_twitter_oauth("", "",
                    "", "")
mm<-userTimeline('mauriciomacri', n=100)
niunamenos <- searchTwitter("#niunamenos exclude:retweets", n=100)
mm.df <- twListToDF(mm)
mm.df[1,1]

searchTwitter('mauriciomacri', since='2019-01-01', until='2019-04-01')

availableTrendLocations()

closestTrendLocations(40.736881,-73.98887)
arg <- getTrends(23424747)

test_user <- getUser("mauriciomacri")

#Creeando nubes de palabras

mm<-searchTwitter('macri', since='2019-03-01', until='2019-04-01')
mm<-userTimeline('CFKArgentina', n=100)
tweets.text <- sapply(mm, function(x) x$getText())
# Replace blank space ("rt")
tweets.text <- gsub("rt", "", tweets.text)
# Replace @UserName
tweets.text <- gsub("@\\w+", "", tweets.text)
# Remove punctuation
tweets.text <- gsub("[[:punct:]]", "", tweets.text)
# Remove links
tweets.text <- gsub("http\\w+", "", tweets.text)
# Remove tabs
tweets.text <- gsub("[ |\t]{2,}", "", tweets.text)
# Remove blank spaces at the beginning
tweets.text <- gsub("^ ", "", tweets.text)
# Remove blank spaces at the end
tweets.text <- gsub(" $", "", tweets.text)

# #convert all text to lower case
tweets.text <- tolower(tweets.text)

library(RColorBrewer)
library(wordcloud)
library(NLP)
library(tm)

tweets.text.corpus<-Corpus(VectorSource(tweets.text))
tweets.text.corpus <- tm_map(tweets.text.corpus, function(x) removeWords(x,stopwords("Spanish")))

wordcloud(tweets.text.corpus,min.freq = 2, scale=c(7,0.5),colors=brewer.pal(8, "Dark2"),  random.color= TRUE, random.order = FALSE, max.words = 100)
 
