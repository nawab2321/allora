cd $HOME && cd basic-coin-prediction-node

sudo docker compose down -v

sudo docker stop $(docker ps -aq) 2>/dev/null

sudo docker rm $(docker ps -aq) 2>/dev/null

sudo docker rmi -f $(docker images -aq) 2>/dev/null

cd $HOME

sudo rm -rf basic-coin-prediction-node

git clone https://github.com/allora-network/basic-coin-prediction-node

cd basic-coin-prediction-node

nano config.json


{
    "wallet": {
        "addressKeyName": "testkey",
        "addressRestoreMnemonic": "confirm soldier loud damage enter estate alter actress initial impact sheriff clown pioneer lobster where length absorb muffin asthma absorb gesture debris ill smart",
        "alloraHomeDir": "",
        "gas": "1000000",
        "gasAdjustment": 1.0,
        "nodeRpc": "https://sentries-rpc.testnet-1.testnet.allora.network/",
        "maxRetries": 1,
        "delay": 1,
        "submitTx": false
    },
    "worker": [
        {
            "topicId": 1,
            "inferenceEntrypointName": "api-worker-reputer",
            "loopSeconds": 5,
            "parameters": {
                "InferenceEndpoint": "http://inference:8000/inference/{Token}",
                "Token": "ETH"
            }
        },
        {
            "topicId": 2,
            "inferenceEntrypointName": "api-worker-reputer",
            "loopSeconds": 5,
            "parameters": {
                "InferenceEndpoint": "http://inference:8000/inference/{Token}",
                "Token": "ETH"
            }
        },
        {
            "topicId": 7,
            "inferenceEntrypointName": "api-worker-reputer",
            "loopSeconds": 5,
            "parameters": {
                "InferenceEndpoint": "http://inference:8000/inference/{Token}",
                "Token": "ETH"
            }
        }
    ]
}



chmod +x init.config
./init.config

docker compose up --build

cd basic-coin-prediction-node

docker compose ps

docker compose logs -f worker
