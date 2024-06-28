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
  bbox = c(2.4166059, 42.5945594, 2.4176574, 42.5962101),
  tags_in_columns = TRUE
)

## View the history of an object
sel <- osm_objs$`name:ca` %in% "Abadia de Sant Miquel de Cuixà"
obj <- osm_objs[sel, ]

obj_history <- osm_history_object(
  osm_type = obj$osm_type, osm_id = obj$osm_id,
  tags_in_columns = FALSE # tags in a list at column `tags`
)
obj_history
# obj_history$tags # tags in list format

## ----changesets---------------------------------------------------------------
chsts <- osm_query_changesets(
  bbox = c(-1.241112, 38.0294955, 8.4203171, 42.9186456),
  user = "Mementomoristultus",
  time = "2023-06-22T02:23:23Z",
  time_2 = "2023-06-22T00:38:20Z"
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

