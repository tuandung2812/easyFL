# python main.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedreg --num_rounds 10 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --num_threads 1
python main.py --task mnist_cnum10_dist1_skew0.8_seed0 --model cnn --algorithm fedjsrl --num_rounds 100 --num_epochs 5 --learning_rate 0.001 --proportion 1 --batch_size 10 --eval_interval 1 --gpu 3 --num_threads 1