library(quanteda)

whitelist_canonicalization <- list(
  "A / B" = "A-B",
  "A/B" = "A-B",
  "US" = "United States",
  "UK" = "United Kingdom"
)

whitelist_phrases <- c(
  "generation x",
  "generation y",
  "generation z",
  "gen x",
  "gen y",
  "gen z",
  "as a service",
  "series a",
  "series b",
  "series c",
  "g suite",
  "g factor",
  "war i",
  "war ii",
  "initiative q",
  "galaxy s",
  "os x",
  "model t",
  "wii u",
  "u test", 
  "united states",
  "united kingdom",
  "v pay",
  "channel v",
  "the x factor",
  "xbox one x",
  "y combinator"
)


##### DEFINE STOPWORDS FOR PROCESSING MWE #####
blacklist_words <- c(
  "retrieved",
  "also",
  "vol", "pp", "pdf", "doi", "Mo", "etc"
)

blacklist_phrases <- c(
  "see also",
  "v t e"
)


stopwords <- stopwords(source = "snowball")
sw_to_exclude <- c()
sw_to_include <- c(blacklist_words, "citation", "citations", "needing", "article", "articles", "archived", "et", "per","external", "links", "cs1", "span",
                   "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december",
                   "references", "unsourced", "used", "can", "date", "dates", "dated", "update", "though", "although", "1em")
if(exists("sw_to_exclude")){
  stopwords <- c(stopwords, sw_to_exclude)
}
if(exists("sw_to_include")){
  stopwords <- c(stopwords, sw_to_include)
}

substrings_to_filter_out <- c("citation", "citations", "needing", "article", "articles", "archived", "external", 
                           "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december",
                           "also known", "references", "international standard", "standard book", "book number", "authors list",
                           "dead link", "multiple names", "list of", "often used", "around", "type", "types", "unsourced", "vino de", "de la", "la tierra",
                           "hong kong", "european", "york", "new zealand", "dotted", "serial", "statespto", "statesa", "united states",
                           "united_states", "united kingdom", "united_kingdom", "canada", "canadian", "product or service", "high school",
                           "school choice", "cfr", "wayback", "san francisco", "los angeles", "africa", "america", "china", "europe", "asia",
                           "parser-", "wikipedia", "isbn", "padding-", "font-size", "margin-", "border-", "outline", "neural", "top-rated",
                           "international_conference", "jmkg", "issn")


#### HELPER FUNCTION FOR FILTERING FOR STOPWORDS #####
match_sw <- function(x, stopwords){
  x %in% stopwords
}

rm(sw_to_exclude, sw_to_include)



