# The name of this view in Looker is "Top Terms"
view: top_terms {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `daveward_demodataset.top_terms`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dma ID" in Explore.

  dimension: dma_id {
    type: number
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    type: string
    sql: ${TABLE}.dma_name ;;
  }

  dimension: state {
    type: string
    sql: RIGHT(${dma_name},2) ;;
    map_layer_name: us_states
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: refresh {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.refresh_date ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.term ;;
  }

  dimension_group: week {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.week ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [dma_name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_rank {
    type: sum
    # hidden: yes
    sql: ${rank} ;;
  }

  measure: average_rank {
    type: average
    # hidden: yes
    sql: ${rank} ;;
  }

  measure: total_score {
    type: sum
    # hidden: yes
    sql: ${score} ;;
  }

  measure: average_score {
    type: average
    # hidden: yes
    sql: ${score} ;;
  }
}
