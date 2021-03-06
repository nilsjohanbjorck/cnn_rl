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

task='walker_walk'


gpu=1
export CUDA_VISIBLE_DEVICES=$gpu; python train.py task_name=$task save_snapshot=True 




