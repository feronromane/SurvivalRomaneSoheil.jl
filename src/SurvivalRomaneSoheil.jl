module SurvivalRomaneSoheil

export kaplan_meier
export visualisation
export risk_instant_grouped
export risk_cumulative_grouped
export plot_censored_distribution
export cox_model

# Write your package code here.

include("kaplanmeier.jl")
include("visualisation.jl")
include("risque.jl")
include("censordistrib.jl")


end
