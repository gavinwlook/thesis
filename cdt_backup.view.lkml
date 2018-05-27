# include: "uk_accidents.model.lkml"
# view: cunning_derived_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     persist_for: "1000 hours"
#     sql: SELECT districts_defined.density as derived_density,
#
#       districts_defined.district as derived_district,
#
#       LAG(districts_defined.district,1) OVER (ORDER BY districts_defined.density) AS lower_district,
#
#       LEAD(districts_defined.district,1) OVER (ORDER BY districts_defined.density) AS higher_district
#
#       FROM UK_Car_Crashes.Accidents  AS accidents
#       LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN ${districts_defined.SQL_TABLE_NAME} AS districts_defined ON districts_defined.district = district.label
#
#       GROUP BY districts_defined.density, districts_defined.district
#
#       ORDER BY 1
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: lower_district {
#     # description: "Unique ID for each user that has ordered"
#     type: string
#     sql: ${TABLE}.lower_district ;;
#   }
#
#   dimension: derived_district {
#     # description: "Unique ID for each user that has ordered"
#     type: string
#     sql: ${TABLE}.derived_district ;;
#   }
#
#   dimension: higher_district {
#     # description: "Unique ID for each user that has ordered"
#     type: string
#     sql: ${TABLE}.higher_district ;;
#   }
#
#   dimension: derived_density {
#     type: number
#     sql: ${TABLE}.derived_density ;;
#   }
# }
