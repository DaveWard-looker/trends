# The name of this view in Looker is "Category Lookup"
view: category_lookup {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `daveward-ps-dev.daveward_demodataset.category_lookup`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_code {
    type: number
    sql: ${TABLE}.category_code ;;
  }

  dimension: item_code {
    type: number
    sql: ${TABLE}.item_code ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_category_code {
    type: sum
    hidden: yes
    sql: ${category_code} ;;
  }

  measure: average_category_code {
    type: average
    hidden: yes
    sql: ${category_code} ;;
  }

  measure: total_item_code {
    type: sum
    hidden: yes
    sql: ${item_code} ;;
  }

  measure: average_item_code {
    type: average
    hidden: yes
    sql: ${item_code} ;;
  }
}
