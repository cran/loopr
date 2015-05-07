\name{loopr-package}
\alias{loopr-package}
\alias{loopr}
\docType{package}
\title{
Uses an Archive to Amend Previous Stages of a Pipe using Current Output
}
\description{
Remedies a common problem in piping: not having access to
intermediate outputs of the pipe. Within a "loop", a piping intermediate
is  stored in a stack archive, data is processed, and then both the
stored intermediate and the current output are reintegrated using an
"ending" function. Two special ending functions are provided: amend and
insert. However, any ending function can be specified, including merge
functions, join functions, setNames(), etc. This framework allows the
following workflow: focus on a particular aspect or section of a
dataset, conduct specific operations, and then reintegrate changes into
the whole.
}
\details{
\tabular{ll}{
Package: \tab loopr\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2015-04-04\cr
License: \tab CC0\cr
}
}
\author{
Brandon Taylor

Maintainer: Brandon Taylor <Brandon.Taylor221@gmail.com>
}