# If necessary, uncomment the line below to include explore_source.
 include: "uk_accidents.model.lkml"

view: districts_defined {
  view_label: "Accident District"
 # If necessary, uncomment the line below to include explore_source.
    derived_table: {
      persist_for: "100000 hours"
      explore_source: local_authority_data {
        column: density {}
        column: area_code {}
        column: population_density_tier {}
        column: count {}
        column: area_ {}
        column: district {}
        column: total_population {}
      }
    }
    dimension: density {
      type: number
    }
    dimension: area_code {}
    dimension: population_density_tier {
      type: tier
      tiers: [25,50,75,100]
      style: interval
      sql: ${density} ;;

    }

    dimension: area_ {
      type: number
    }
    dimension: district {
      primary_key: yes
      hidden: yes
    }
    dimension: total_population {
      type: number
      label: "District Population"
    }
    dimension: District_Image {
#       sql: ${district} ;;
#       html: <div style="width: 200px; text-align: center; margin: auto">
#       <img src=
#       "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ value | replace: '%', ' ' | url_param_escape }}%25district%25council%25logo"
#       alt="{{value}}" style="height: 200px; width: 200px; border-radius: 20px; margin-bottom: 5px;" />
#       </div> ;;

      sql: ${district} ;;
      html: <div style="width: 200px; text-align: center; margin: auto">
      <img src=
      "https://looker-feeling-lucky.herokuapp.com/api.php?q={{ value | replace: '%', ' ' | url_param_escape }}%20district%20council"
      alt="{{value}}" style="height: 150px; max-width: 100%; height: 100px; border-radius: 10px; margin-bottom: 5px;" />
      </div> ;;
    }


  measure: count {
    type: count
  }
  }
