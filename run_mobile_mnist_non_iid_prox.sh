

# 3 epoch, all clients, frequency = 6
python main_mobile.py --edge_update_frequency 6 --task  mnist_cnum60_dist1_skew0.8_seed0 --non_iid_classes 1 --mean_velocity 50 --std_velocity 10  --sample uniform --model mlp --algorithm fed_mobile_prox_vanilla --num_edges 5 --num_clients 50 --std_num_clients 10 --num_rounds 100 --num_epochs 3 --learning_rate 0.001 --momentum 0.9 --proportion 0.5 --batch_size 10 --eval_interval 1 --gpu 0 --server_gpu_id -1 --num_threads 1
