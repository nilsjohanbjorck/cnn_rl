gpu=$1
ex_idx=$2


source activate drqv2

export MUJOCO_GL=egl
computerid=$(hostname)
echo $computerid
if [ $computerid == 'c0021' ]; then
   echo 'running on c0021'
   export MUJOCO_LICENSE_PATH=$HOME/.mujoco/mjkey_c0021_paid.txt
   export MJKEY_PATH=$HOME/.mujoco/mjkey_c0021_paid.txt
fi

if [ $computerid == 'c0018' ]; then
   echo 'running on c0018'
   export MUJOCO_LICENSE_PATH=$HOME/.mujoco/mjkey_c0018.txt
   export MJKEY_PATH=$HOME/.mujoco/mjkey_c0018_paid.txt
fi

if [ $computerid == 'c0019' ]; then
   echo 'running on c0019'
   export MUJOCO_LICENSE_PATH=$HOME/.mujoco/mjkey_c0019.txt
   export MJKEY_PATH=$HOME/.mujoco/mjkey_c0019_paid.txt
fi

export MUJOCO_LICENSE_PATH=$HOME/.mujoco/mjkey_tmp_free.txt
export MJKEY_PATH=$HOME/.mujoco/mjkey_tmp_free.txt



declare -A var_tasks=(
    ['1']='finger_turn_hard'
    ['2']='walker_walk'
    ['3']='hopper_hop'
    ['4']='acrobot_swingup'
    ['5']='reacher_hard'
)


declare -A med_tasks=(
    ['1']='finger_turn_easy'
    ['2']='walker_run'
    ['3']='cheetah_run'
    ['4']='cartpole_swingup_sparse'
    ['5']='reacher_easy'
    ['6']='quadruped_walk'
    ['7']='quadruped_run'
    ['8']='reach_duplo'
    ['9']='finger_turn_hard'
    ['10']='hopper_hop'
    ['11']='acrobot_swingup'
    ['12']='reacher_hard'
)



idxs=('9' '12' '5' '1')

for idx in ${idxs[@]};
do
echo $idx
seed=$(python seeds/seeds.py --index $ex_idx)
task=${med_tasks[$idx]}
dirname="runs2/8thOctober_stridedencoder/task_"$task"_idx_"$ex_idx"_seed_"$seed
echo "running:" $dirname  $gpu 
export CUDA_VISIBLE_DEVICES=$gpu; python train.py task_name=$task seed=$seed hydra.run.dir=$dirname agent.strided_encoder=True 
done






