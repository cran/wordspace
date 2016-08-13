\name{rowNorms}
\alias{rowNorms}
\alias{colNorms}
\title{
  Compute Norms of Row and Column Vectors of a Matrix (wordspace)
}
\description{

  Efficiently compute the norms of all row or column vectors of a dense or sparse matrix.

}
\usage{

rowNorms(M, method = "euclidean", p = 2)

colNorms(M, method = "euclidean", p = 2)

}
\arguments{

  \item{M}{a dense or sparse numeric matrix}

  \item{method}{norm to be computed (see \dQuote{Norms} below for details)}

  \item{p}{exponent of the \code{minkowski} p-norm, a numeric value in the range \eqn{1 \le p \le \infty}.

    Values \eqn{0 \le p < 1} are also permitted as an extension but do not correspond to a proper mathematical norm (see details below).
  }

}
\section{Norms}{

  Given a row or column vector \eqn{x}, the following length measures can be computed:

  \describe{
    \item{\code{euclidean}}{The \bold{Euclidean} norm given by \deqn{
        \|x\|_2 = \sqrt{ \sum_i x_i^2 }}{ |x|_2 = sqrt( SUM(i) (x_i)^2 ) }
    }
    \item{\code{maximum}}{The \bold{maximum} norm given by \deqn{
        \|x\|_{\infty} = \max_i |x_i| }{ |x|_Inf = MAX(i) |x_i| }
    }
    \item{\code{manhattan}}{The \bold{Manhattan} norm given by \deqn{
        \|x\|_1 = \sum_i |x_i| }{ |x|_1 = SUM(i) |x_i| }
    }
    \item{\code{minkowski}}{The \bold{Minkowski} (or \eqn{L_p}) norm given by \deqn{
        \|x\|_p = \left( \sum_i |x_i|^p \right)^{1/p} }{ |x|_p = [ SUM(i) |x_i|^p ]^(1/p) }
      for \eqn{p \ge 1}.  The Euclidean (\eqn{p = 2}) and Manhattan (\eqn{p = 1}) norms are special cases, and the maximum norm corresponds to the limit for \eqn{p \to \infty}{p -> Inf}.

      As an extension, values \eqn{0\le p < 1} compute the length measure \deqn{
        \|x\|_p = \sum_i |x_i|^p }{ |x|_p = SUM(i) |x_i|^p }
      This formula does not define a proper mathematical norm because it is not homogeneous (\eqn{\|r\cdot x\| \ne |r|\cdot \|x\|}{|r * x| != |r| * |x|} for a scalar factor \eqn{r}).  However, it does satisfy the triangle inequality and is thus still a sensible measure of vector length.  In the special case \eqn{p = 0}, the length \eqn{\|x\|_0}{|x|_0} corresponds to the number of nonzero elements in the vector \eqn{x}.
    }
  }
}
\value{

  A numeric vector containing one norm value for each row or column of \code{M}.

}
%% \references{
%% }
\seealso{
  
  \code{\link{dist.matrix}}, \code{\link{normalize.rows}}
  
}
\examples{

rowNorms(DSM_TermContextMatrix, "manhattan")

colNorms(DSM_TermContextMatrix, "minkowski", p=0) # number of nonzero cells

}
\author{Stefan Evert (\url{http://purl.org/stefan.evert})}