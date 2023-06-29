#!/usr/bin/env bash

# Run a grid search with bash

#set -x

# Arrays of params to loop over
envs=( GridWorld FrozenLake CliffWalking)
seeds=(0 1 2 4)
nepisodes=(2000)

for seed in ${seeds[@]}
do
    for env in ${envs[@]}
    do
        python main.py --seed ${seed[@]} --num_episodes ${nepisodes[@]} --env ${env[@]}
    done
done
