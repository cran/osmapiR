% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/osmapi_miscellaneous.R
\name{osm_permissions}
\alias{osm_permissions}
\title{Retrieving permissions}
\usage{
osm_permissions(format = c("R", "xml", "json"))
}
\arguments{
\item{format}{Format of the output. Can be \code{"R"} (default), \code{"xml"}, or \code{"json"}.}
}
\value{
If the API client is not authorized, an empty list of permissions will be returned. Otherwise, the list will
be based on the granted scopes of the logged user.
}
\description{
Returns the permissions granted to the current API connection.
}
\details{
Currently the following permissions can appear in the result, corresponding directly to the ones used in the OAuth
2.0 application definition:
\itemize{
\item allow_read_prefs (read user preferences)
\item allow_write_prefs (modify user preferences)
\item allow_write_diary (create diary entries, comments and make friends)
\item allow_write_api (modify the map)
\item allow_write_changeset_comments
\item allow_write_redactions (redact element versions)
\item allow_read_gpx (read private GPS traces)
\item allow_write_gpx (upload GPS traces)
\item allow_write_notes (modify notes)
\item allow_write_redactions (redact map data)
\item allow_write_blocks (create and revoke user blocks)
\item allow_consume_messages (read, update status and delete user messages)
\item allow_send_messages (send private messages to other users)
}
}
\note{
For compatibility reasons, all OAuth 2.0 scopes will be prefixed by "allow_", e.g. scope "read_prefs" will be
shown as permission "allow_read_prefs".
}
\examples{
\dontrun{
perms <- osm_permissions()
perms
}
}
\seealso{
Other API functions: 
\code{\link{authenticate_osmapi}()},
\code{\link{osm_api_versions}()},
\code{\link{osm_capabilities}()},
\code{\link{set_osmapi_connection}()}
}
\concept{API functions}
