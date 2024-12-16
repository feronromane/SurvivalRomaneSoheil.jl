using SurvivalRomaneSoheil
using Plots
using KernelDensity


# Données simulées
###################################################################################################
times = [5.0, 6.0, 7.0, 10.0, 12.0, 14.0, 15.0, 18.0, 20.0, 21.0]  # Temps de suivi
events = [true, true, false, true, true, false, false, true, true, false]  # Événement observé
groups = ["A","B","B","B","A","B","A","A","A","B"]
###################################################################################################

#test Kaplan Meier
###################################################################################################
results = kaplan_meier(times, events, groups)

plt = plot(title="Kaplan-Meier Survival Curves", 
           xlabel="Time", 
           ylabel="Survival Probability", 
           legend=:topright, 
           lw=2)

unique_groups = unique(groups)
for g in unique_groups
    group_times, group_surv_prob = results[g]
    plot!(plt, group_times, group_surv_prob, label="Group $g",line=:step)
end

display(plt)
###################################################################################################################

#test visualisation
###################################################################################################################
#visualisation(times,events)
###################################################################################################################

#test risque
###################################################################################################################
# Calcul des risques instantanés et cumulés par groupe
#= risk_inst_results = risk_instant(times, events, groups)
risk_cum_results = risk_cumulative(times, events, groups)


plt = plot(title="Risques Instantanés et Cumulés", xlabel="Time", ylabel="Risk")
# Risques instantanés
for g in unique(groups)
    unique_times, risk_inst = risk_inst_results[g]
    plot!(plt,unique_times, risk_inst, label="Instant Risk Group $g", lw=2, line=:step)
end
# Risques cumulés
for g in unique(groups)
    unique_times, risk_cum = risk_cum_results[g]
    plot!(plt,unique_times, risk_cum, label="Cumulative Risk Group $g", lw=2, line=:step)
end
display(plt) =#
####################################################################################################################

#données censurées distribution
####################################################################################################################
#plot_censored_distribution(times,events,groups)

####################################################################################################################
