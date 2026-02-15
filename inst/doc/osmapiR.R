## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(osmapiR)

## ----osm objects--------------------------------------------------------------
## Download objects by bounding box
osm_objs <- osm_bbox_objects(
  bbox = c(2.4166059, 42.5945594, 2.4176574, 42.5962101)
)
head(osm_objs)

# osm_objs$tags # tags in list format

## View the history of an object
sel <- sapply(osm_objs$tags, function(x) any(x$key == "name:ca" & x$value == "Abadia de Sant Miquel de Cuixà"))
obj <- osm_objs[sel, ]

obj_history <- osm_history_object(
  osm_type = obj$type[1], osm_id = obj$id[1],
  tags_in_columns = TRUE
)
obj_history

## ----changesets---------------------------------------------------------------
chsts <- osm_query_changesets(
  bbox = c(2.65, 42.68, 2.71, 42.69),
  user = "Quercinus",
  time = "2023-06-20",
  time_2 = "2023-06-22"
)
chsts

osmchange <- osm_download_changeset(changeset_id = 137595351, format = "xml")
osmchange

# Osmchange file compatible with JOSM and others:
# xml2::write_xml(osmchange, file = tempfile(fileext = ".osc"))

## ----notes--------------------------------------------------------------------
notes <- osm_read_bbox_notes(bbox = "2.4166059,42.5945594,2.4176574,42.5962101", closed = -1)
notes

# notes$comments

## ----gpx----------------------------------------------------------------------
gpx <- osm_get_points_gps(bbox = c(2.4166059, 42.5945594, 2.4176574, 42.5962101))
gpx

## ----users--------------------------------------------------------------------
usrs <- osm_get_user_details(user_id = c(1, 24, 44, 45))
usrs

