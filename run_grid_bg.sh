#!/usr/bin/env bash

# Run a grid search with bash in parallel, unordered. Max simultaneous jobs is
# specified

# Settings
i=0
count=0
now=logs/$(date +"%Y%m%d%H%M")
p_jobs=4 # max parallel jobs

# Arrays of params to loop over
envs=(GridWorld FrozenLake CliffWalking)
seeds=(0 1 2 4)
nepisodes=(2000)

(
for seed in ${seeds[@]}
do
    for env in ${envs[@]}
    do
        ((count++))
        # PG Bellman
        ((i=i%p_jobs)); ((i++==0)) && wait # job lock
        echo "forking"

        python main.py  --seed ${seed[@]} --num_episodes ${nepisodes[@]} \ 
            --env ${env[@]} >"${now}_out${count}.txt" &

        # Wait a sec otherwise race condition in directory creation
        sleep 0.5
    done
done
)
