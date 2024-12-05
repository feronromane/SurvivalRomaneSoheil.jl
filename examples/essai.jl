println(bonjour())
# Données simulées
times = [5.0, 6.0, 7.0, 10.0, 12.0, 14.0, 15.0, 18.0, 20.0, 21.0]  # Temps de suivi
events = [true, true, false, true, true, false, false, true, true, false]  # Événement observé

# Appeler la fonction Kaplan-Meier
unique_times, survival_probs = kaplan_meier_manual(times, events)

# Afficher les résultats
println("Temps uniques : ", unique_times)
println("Probabilités de survie : ", survival_probs)

using Plots
plot(unique_times, survival_probs, label="Kaplan-Meier", xlabel="Temps", ylabel="Probabilité de survie", lw=2)
