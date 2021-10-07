idxs=('1' '2' '3' '4' '5')
#idxs=('6' '7' '8' '9' '10')
#idxs=('11' '12' '13' '14' '15')
#idxs=('3' '4' '5')


declare -A gpu=(
    ['1']="0"
    ['2']="1"
    ['3']="2"
    ['4']="3"
    ['5']="4"
    ['6']="0"
    ['7']="1"
    ['8']="2"
    ['9']="3"
    ['10']="4"
    ['11']="0"
    ['12']="1"
    ['13']="2"
    ['14']="3"
    ['15']="4"
    ['16']="3"
    ['17']="4"
    ['18']="3"
    ['19']="3"
    ['20']="4"
)



for idx in ${idxs[@]}; 
do
echo $idx
gpu=${gpu[$idx]}
task=${hard_tasks[$idx]}
./slave.sh $gpu $idx &
#./slave_fork.sh $gpu $idx &
JOB_PID=$!
echo "for task "$task" job_pid is "$JOB_PID
done



