Rails.application.routes.draw do
  root 'residential#index'

  get 'residential/index'
  get 'residential/data', defaults: { format: 'json' }

  get 'residential/bar_chart'
  get 'residential/bar_data', defaults: { format: 'json' }

  get 'residential/scatter_chart'
  get 'residential/scatter_data', defaults: { format: 'json' }

  get 'residential/boxplot_chart'

  get 'map/index'
  get 'map/map_data', defaults: { format: 'json' }
end
