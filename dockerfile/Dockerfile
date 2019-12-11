FROM tensorflow/tensorflow:2.0.0-gpu-py3
COPY ./runTensorBoard.sh .
RUN /bin/bash -c 'chmod +x ./runTensorBoard.sh'
CMD ["bin/bash","./runTensorBoard.sh"]


