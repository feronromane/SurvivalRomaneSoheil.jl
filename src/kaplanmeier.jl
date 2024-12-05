function kaplan_meier_manual(time::Vector{Float64}, event::Vector{Bool})
    # Vérifier la validité des entrées
    if length(time) != length(event)
        throw(ArgumentError("Les vecteurs 'time' et 'event' doivent avoir la même longueur"))
    end

    # Trier les données par temps croissant
    sorted_indices = sortperm(time)
    time = time[sorted_indices]
    event = event[sorted_indices]

    # Initialiser les variables
    n = length(time)
    survival_prob = Float64[]  # Probabilités de survie
    survival = 1.0             # Probabilité initiale
    unique_times = []          # Points de temps uniques
    n_at_risk = n              # Nombre à risque au début

    # Parcourir les temps
    for i in 1:n
        if i == 1 || time[i] != time[i - 1]
            push!(unique_times, time[i])
            d_i = sum(event[j] && time[j] == time[i] for j in 1:n)  # Nb événements à t_i
            n_i = n_at_risk                                        # Nb à risque juste avant t_i
            survival *= (1 - d_i / n_i)                           # Proba survie
            push!(survival_prob, survival)                        # Stocker S(t)
        end
        n_at_risk -= 1  # Mettre à jour ceux encore à risque
    end

    return unique_times, survival_prob
end




