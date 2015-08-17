library(tm)
library(wordcloud)


#  ------------------------------------------------------------------------

cols = function(){

  rgb(c(0, 149, 129, 225, 62, 246, 59, 181, 197, 0, 51) / 255,
      c(74, 192, 52, 84, 163, 195, 149, 197, 59, 180, 51) / 255,
      c(131, 31, 138, 68, 225, 20, 54, 197, 40, 164, 51) / 255)


}

i = 0
words = read.csv('Input/words_0.csv')
ind = words$Freq == 1
set.seed(1)
words$Freq[ind] = sample(1:6, sum(ind), replace = TRUE)


#  ------------------------------------------------------------------------

#for (i in 1:200){
  set.seed(78)
  png(sprintf('Output/wordcloud1_%d.png', i),
      width = 1000,
      height = 250)
  wordcloud(words$Word,
            freq = words$Freq,
            scale = c(5, 1),
            min.freq = 1,
            fixed.asp = FALSE,
            random.color = TRUE,
            rot.per = 0,
            colors = c(rep('#333333', 3), sample(cols(), nrow(words) - 3, replace = TRUE)))
  dev.off()
#}
