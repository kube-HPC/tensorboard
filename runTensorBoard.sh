if [[ (-z "${logDir}") ]]; then
    echo "Must supply logs directory."
else
    if [[ "${DEFAULT_STORAGE}" == "fs" ]]; then 
        python /usr/local/lib/python3.6/dist-packages/tensorboard/main.py --logdir ${logDir} --bind_all
    else
        credentials_file="/root/.aws/credentials"
        if [[ !(-z "${AWS_ACCESS_KEY_ID}") ]]; then
            if [[ !(-z "${AWS_SECRET_ACCESS_KEY}") ]]; then
                mkdir /root/.aws
                echo [default] > ${credentials_file}
                echo aws_access_key_id=${AWS_ACCESS_KEY_ID}>>${credentials_file}
                echo aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}>>${credentials_file}
                export S3_ENDPOINT=`echo ${S3_ENDPOINT_URL}|sed 's/https\?:\/\///'`
                if [[ ${S3_ENDPOINT_URL} == https* ]]; then
                    export S3_USE_HTTPS="1"
                else
                    export S3_USE_HTTPS="0"  
                fi
                python /usr/local/lib/python3.6/dist-packages/tensorboard/main.py --logdir ${logDir} --bind_all
            fi
        fi
        if  ! test -f "$credentials_file"; then
            echo "Must supply S3 credentials: aws_access_key_id, aws_secret_access_key"
        fi
    fi
fi
