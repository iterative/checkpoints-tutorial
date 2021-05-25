function checkpoint() {
  [[ -z "$DVC_ROOT" ]] && return
  FLAG="$DVC_ROOT/.dvc/tmp/DVC_CHECKPOINT"
  touch "$FLAG" && while test -f "$FLAG"; do true; done
}

for iteration in {1..10}; do
    ln -s /dev/random test.data
    checkpoint
    sleep 1
done
