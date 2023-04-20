# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedtheo --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --num_threads 1
python main_mobile.py --task cifar10_cnum50_dist3_skew0.8_seed0 --sample active --model mlp --algorithm fed_edgeavg --num_edges 5 --num_clients 50 --std_num_clients 10 --num_rounds 100 --num_epochs 1 --learning_rate 0.01 --momentum 0.9 --proportion 1 --batch_size 10 --eval_interval 1 --gpu -1 --server_gpu_id 0 --num_threads 1

python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --sample active --model mlp --mean_velocity 100 --std_velocity 10 --algorithm fed_edgeavg --edge_update_frequency 4 --num_edges 5 --mean_num_vehicle_clients 50 --std_num_vehicle_clients 10 --num_rounds 500 --num_epochs 1 --learning_rate 0.01 --momentum 0.9 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2 --num_threads 1

python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --sample active --model mlp --mean_velocity 100 --std_velocity 10 --algorithm fed_edgeavg --edge_update_frequency 1 --num_edges 15 --mean_num_vehicle_clients 50 --std_num_vehicle_clients 10 --num_rounds 500 --num_epochs 1 --learning_rate 0.01 --momentum 0.9 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 1 --num_threads 1

python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --sample active --model mlp --mean_velocity 100 --std_velocity 10 --algorithm fed_edgeavg --edge_update_frequency 1 --num_edges 25 --mean_num_vehicle_clients 50 --std_num_vehicle_clients 10 --num_rounds 500 --num_epochs 1 --learning_rate 0.01 --momentum 0.9 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2 --num_threads 1

python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --sample active --model mlp --mean_velocity 100 --std_velocity 10 --algorithm rand_fed_edgeavg --edge_update_frequency 1 --num_edges 5 --mean_num_vehicle_clients 50 --std_num_vehicle_clients 10 --num_rounds 500 --num_epochs 1 --learning_rate 0.01 --momentum 0.9 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 1 --num_threads 1

# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedavg --road_length 1000 --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --momentum 1e-6 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2
# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedavg --road_length 1000 --num_edges 25 --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --momentum 1e-6 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2
# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedavg --road_length 1000 --num_edges 50 --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --momentum 1e-6 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2
# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedavg --road_length 2000 --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --momentum 1e-6 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2

# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedavg --road_length 2000 --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --momentum 1e-6 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --server_gpu_id 2

# python main_mobile.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedprox --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3

# python main_mobile.py --task mnist_cnum100_dist2_skew0.3_seed0 --model cnn --algorithm fedrl --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3
# python main_mobile.py --task mnist_cnum100_dist2_skew0.3_seed0 --model cnn --algorithm fedavg --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3
# python main_mobile.py --task mnist_cnum100_dist2_skew0.3_seed0 --model cnn --algorithm fedprox --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3

# python main_mobile.py --task mnist_cnum100_dist3_skew0.4_seed0 --model cnn --algorithm fedrl --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3
# python main_mobile.py --task mnist_cnum100_dist2_skew0.4_seed0 --model cnn --algorithm fedavg --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3
# python main_mobile.py --task mnist_cnum100_dist2_skew0.4_seed0 --model cnn --algorithm fedprox --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3