ARG BASE_PRIVATE_REGISTRY=""
FROM ${BASE_PRIVATE_REGISTRY}tensorflow/tensorflow:2.0.0-gpu-py3
COPY ./runTensorBoard.sh .
CMD ["bin/bash","./runTensorBoard.sh"]


