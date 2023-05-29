python generate_fedtask.py --dataset mnist --dist 2 --skew 0.05 --num_clients 100
python main_experiments.py --k_clients 20 --num_clients_add 0 --num_clients_delete 0 --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1
python main_experiments.py --k_clients 20 --num_clients_add 0 --num_clients_delete 3 --rounds_per_delete 25  --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1
python main_experiments.py --k_clients 20 --num_clients_add 5 --num_clients_delete 0 --rounds_per_add 20  --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1
python main_experiments.py --k_clients 20 --num_clients_add 5  --num_clients_delete 5 --rounds_per_add 20 --rounds_per_delete 25  --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1
python main_experiments.py --k_clients 20 --num_clients_add 2 --num_clients_delete 0 --rounds_per_add 20  --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1
python main_experiments.py --k_clients 20 --num_clients_add 3 --num_clients_delete 0 --rounds_per_add 20  --task mnist_cnum100_dist2_skew0.05_seed0 --sample active --model cnn --algorithm fedavg_client_experiment --num_rounds 200 --num_epochs 3 --learning_rate 0.001 --momentum 0.95 --proportion 1 --batch_size 64 --eval_interval 1 --gpu 0 --server_gpu_id 2 --num_threads 1