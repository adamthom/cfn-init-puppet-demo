node basenode {
    include cfn
}

node /^.*internal$/ inherits basenode {
    case $cfn_roles {
        /wordpress/ : { include wordpress }
    }
}
