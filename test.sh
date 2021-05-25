function checkpoint() {
  [[ -z "$DVC_ROOT" ]] && return
  FLAG="$DVC_ROOT/.dvc/tmp/DVC_CHECKPOINT"
  touch "$FLAG" && while test -f "$FLAG"; do true; done
}

test -f test.data || echo 0 > test.data
echo "Initial state $(cat test.data)"

for iteration in {1..10}; do
    echo $(($(cat test.data)+1)) > test.data
    echo "New state $(cat test.data)"
    checkpoint
    sleep 1
done

echo "Finished!"
