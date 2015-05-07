## ---- message=FALSE------------------------------------------------------
library(loopr)
library(dplyr)
library(magrittr)
library(knitr)

## ------------------------------------------------------------------------
loop = loop$new()

## ------------------------------------------------------------------------
id = c(1, 2, 3, 4)
toFix = c(0, 0, 1, 1)
group = c(1, 1, 1, 0)
example = data_frame(id, toFix, group)
kable(example)

## ------------------------------------------------------------------------
stack = stack$new()

## ------------------------------------------------------------------------
stack$push(1)
stack$push(2)
stack$push(3)

## ------------------------------------------------------------------------
stack$peek

## ------------------------------------------------------------------------
stack$stack

## ------------------------------------------------------------------------
stack$height

## ------------------------------------------------------------------------
stack$pop
stack$pop
stack$pop

## ------------------------------------------------------------------------
stack$stack

## ------------------------------------------------------------------------
"first" %>%
loop$begin()

## ------------------------------------------------------------------------
"second" %>%
  loop$end(paste)

## ------------------------------------------------------------------------
"first" %>%
  loop$begin()

"second" %>%
  loop$cross(paste)

## ---- eval=FALSE---------------------------------------------------------
#  end(endData, FUN, ...) = FUN(stack$pop, endData, ...)
#  
#  cross(crossData, FUN, ...) = FUN(crossData, stack$pop, ...)

## ------------------------------------------------------------------------
insertData =
  example %>%
  filter(toFix == 0) %>%
  mutate(toFix = 1) %>%
  select(-group)

## ------------------------------------------------------------------------
insert(example, insertData, by = "id")

## ------------------------------------------------------------------------
oldColumn = c(0, 0)
newColumn = c(1, NA)
data_frame(oldColumn, newColumn) %>%
  amendColumns("oldColumn", "newColumn")

## ------------------------------------------------------------------------
oldColumn = c(0, 0)
newColumn = c(1, NA)
data_frame(oldColumn, newColumn) %>%
  fillColumns("newColumn", "oldColumn")

## ------------------------------------------------------------------------
amendData = insertData

amend(example, amendData, by = "id")

## ------------------------------------------------------------------------
amendData = insertData

example %<>% group_by(id)

amend(example, amendData)

## ------------------------------------------------------------------------
kable(example)

## ------------------------------------------------------------------------
example %>%
  ungroup %>%
  loop$begin() %>%
    slice(1) %>%
    mutate(toFix = 1) %>%
  loop$end(insert, by = "id") %>%
  kable

## ------------------------------------------------------------------------
example %>%
  group_by(group) %>%
  loop$begin() %>%
    summarize(toFix = mean(toFix)) %>%
    mutate(group = rev(group)) %>%
  loop$end(amend) %>%
  kable

