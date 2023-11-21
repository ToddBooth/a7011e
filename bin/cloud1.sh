aws cloudformation \
    create-stack \
        --stack-name Todboo7UserStack \
        --capabilities CAPABILITY_NAMED_IAM \
        --template-body file://../cloudformation/cloud1.yaml

    # create-stack update-stack 
