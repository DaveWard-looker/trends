- dashboard: google_trends
  title: Google Trends
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  elements:
  - title: Top 25 trends
    name: Top 25 trends
    model: google_trends
    explore: top_terms
    type: looker_bar
    fields: [top_terms.term, top_terms.total_score]
    sorts: [top_terms.total_score desc]
    limit: 25
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Week: top_terms.week_week
      Term: top_terms.term
      Rank: top_terms.rank
    row: 0
    col: 5
    width: 15
    height: 10
  - title: Trend Per State
    name: Trend Per State
    model: google_trends
    explore: top_terms
    type: looker_map
    fields: [top_terms.total_score, top_terms.state]
    sorts: [top_terms.total_score desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Week: top_terms.week_week
      Term: top_terms.term
      Rank: top_terms.rank
    row: 10
    col: 0
    width: 24
    height: 13
  - title: Untitled
    name: Untitled
    model: google_trends
    explore: top_terms
    type: single_value
    fields: [top_terms.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Count of searchs
    defaults_version: 1
    row: 0
    col: 0
    width: 5
    height: 10
  filters:
  - name: Week
    title: Week
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: google_trends
    explore: top_terms
    listens_to_filters: []
    field: top_terms.week_week
  - name: Term
    title: Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: google_trends
    explore: top_terms
    listens_to_filters: []
    field: top_terms.term
  - name: Rank
    title: Rank
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: google_trends
    explore: top_terms
    listens_to_filters: []
    field: top_terms.rank
