if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CUSTOM}/plugins/zsh-kubecolor/completion/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE || ! -s $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

if (( $+commands[fzf] )); then
	# complition
	source ${0:h}/completion/kubecolor_completion
	source ${0:h}/alias/fzf.zsh
fi

if (( $+commands[helm] )); then
	source ${0:h}/alias/helm.zsh
fi

if (( $+commands[flux] )); then
        source ${0:h}/alias/flux.zsh
fi

# This command is used a LOT both below and in daily life
alias k=kubectl

# Execute a kubectl command against all namespaces
alias kca='_kca(){ kubecolor "$@" --all-namespaces;  unset -f _kca; }; _kca'

# Apply a YML file
alias kaf='kubecolor apply -f'

# Drop into an interactive terminal on a container
alias keti='kubecolor exec -ti'
ke() {
  kubectl exec -it $1 -- $2
}

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='kubecolor config use-context'
alias kcsc='kubecolor config set-context'
alias kcdc='kubecolor config delete-context'
alias kccc='kubecolor config current-context'

# List all contexts
alias kcgc='kubecolor config get-contexts'

# General aliases
alias kg='kubecolor get'
alias kd='kubecolor describe'
alias kdel='kubecolor delete'
alias kdelf='kubecolor delete -f'
alias kdelfo='kubecolor delete --grace-period=0 --force'


# Pod management.
alias kgp='kubecolor get pods'
alias kgkr='kubecolor get pods --field-selector=status.phase=Running'
alias kgpa='kubecolor get pods --all-namespaces'
alias kgpanr='kubecolor get pods --all-namespaces --field-selector=status.phase!=Running'
alias kgpw='kgp --watch'
alias kgpow='kgp -o wide'
alias kgpoy='kgp -o yaml'
alias wkgpa='watch --color -n2 "kubecolor --force-colors get pods --all-namespaces"'
alias wkgp='watch --color -n2 "kubecolor --force-colors  get po"'
alias kgpwide='kgp -o wide'
alias kep='kubecolor edit pods'
alias kdp='kubecolor describe pods'
alias kdelp='kubecolor delete pods'
alias kdelpf='kubecolor delete pods --force'
alias kgpall='kubecolor get pods --all-namespaces -o wide'
alias kdelpofo='kubecolor delete --grace-period=0 --force po'
alias kgpae='kgpa | grep -v Running | grep -v Completed'

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl='kgp -l'

# get pod by namespace: kgpn kube-system"
alias kgpn='kgp -n'

# Service management.
alias kgs='kubecolor get svc'
alias kgsa='kubecolor get svc --all-namespaces'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kes='kubecolor edit svc'
alias kds='kubecolor describe svc'
alias kdels='kubecolor delete svc'

# Ingress management
alias kgi='kubecolor get ingress'
alias kgia='kubecolor get ingress --all-namespaces'
alias kei='kubecolor edit ingress'
alias kdi='kubecolor describe ingress'
alias kdeli='kubecolor delete ingress'

# Namespace management
alias kgns='kubecolor get namespaces'
alias kens='kubecolor edit namespace'
alias kdns='kubecolor describe namespace'
alias kdelns='kubecolor delete namespace'
alias kcn='kubecolor config set-context --current --namespace'

# ConfigMap management
alias kgcm='kubecolor get configmaps'
alias kgcma='kubecolor get configmaps --all-namespaces'
alias kecm='kubecolor edit configmap'
alias kdcm='kubecolor describe configmap'
alias kdelcm='kubecolor delete configmap'

# Secret management
alias kgsec='kubecolor get secret'
alias kgsecoy='kubecolor get secret -o yaml'
alias kgseca='kubecolor get secret --all-namespaces'
alias kdsec='kubecolor describe secret'
alias kdelsec='kubecolor delete secret'

# Deployment management.
alias kgd='kubecolor get deployment'
alias kgda='kubecolor get deployment --all-namespaces'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias ked='kubecolor edit deployment'
alias kdd='kubecolor describe deployment'
alias kdeld='kubecolor delete deployment'
alias ksd='kubecolor scale deployment'
alias ksd0='kubectl scale deployment --replicas=0'
alias ksd1='kubectl scale deployment --replicas=1'
alias krsd='kubecolor rollout status deployment'
kres(){
    kubecolor set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
}

# Rollout management.
alias krh='kubecolor rollout history'
alias kru='kubecolor rollout undo'

# Statefulset management.
alias kgss='kubecolor get statefulset'
alias kgssa='kubecolor get statefulset --all-namespaces'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias kess='kubecolor edit statefulset'
alias kdss='kubecolor describe statefulset'
alias kdelss='kubecolor delete statefulset'
alias ksss='kubecolor scale statefulset'
alias kss0='kubectl scale statefulset --replicas=0'
alias kss1='kubectl scale statefulset --replicas=1'
alias krsss='kubecolor rollout status statefulset'

# Port forwarding
alias kpf="kubecolor port-forward"

# Tools for accessing all information
alias kga='kubecolor get all'
alias kgaa='kubecolor get all --all-namespaces'

# Logs
alias kl='kubecolor logs'
alias kl1h='kubecolor logs --since 1h'
alias kl1m='kubecolor logs --since 1m'
alias kl1s='kubecolor logs --since 1s'
alias klf='kubecolor logs -f'
alias klf1h='kubecolor logs --since 1h -f'
alias klf1m='kubecolor logs --since 1m -f'
alias klf1s='kubecolor logs --since 1s -f'

# File copy
alias kcp='kubecolor cp'

# Node Management
alias kgno='kubecolor get nodes'
alias keno='kubecolor edit node'
alias kdno='kubecolor describe node'
alias kdelno='kubecolor delete node'

# PVC management.
alias kgpvc='kubecolor get pvc'
alias kgpvca='kubecolor get pvc --all-namespaces'
alias kgpvcw='kgpvc --watch'
alias kepvc='kubecolor edit pvc'
alias kdpvc='kubecolor describe pvc'
alias kdelpvc='kubecolor delete pvc'

# Service account management.
alias kdsa="kubecolor describe sa"
alias kdelsa="kubecolor delete sa"

# DaemonSet management.
alias kgds='kubecolor get daemonset'
alias kgdsy='kubecolor get DaemonSet -oyaml'
alias kgdsw='kgds --watch'
alias keds='kubecolor edit daemonset'
alias kdds='kubecolor describe daemonset'
alias kdelds='kubecolor delete daemonset'

# CronJob management.
alias kgcj='kubecolor get cronjob'
alias kecj='kubecolor edit cronjob'
alias kdcj='kubecolor describe cronjob'
alias kdelcj='kubecolor delete cronjob'

# Only run if the user actually has kubectl installed
if (( ${+_comps[kubectl]} )); then
  kj() { kubectl "$@" -o json | jq; }
  kjx() { kubectl "$@" -o json | fx; }
  ky() { kubectl "$@" -o yaml | yh; }

  compdef kj=kubectl
  compdef kjx=kubectl
  compdef ky=kubectl
fi

# persistenvolume
alias kgpv='kubecolor get pv'
alias kdpv='kubecolor describe pv'
alias kdelpv='kubecolor delete pv'
alias kepv='kubecolor edit pv'

# storageclass
alias kgsc='kubecolor get storageclass'
alias kdsc='kubecolor describe storageclass'
alias kdelsc='kubecolor delete storageclass'
alias kesc='kubecolor edit storageclass'

# custom resource
alias kgir='kubecolor get IngressRoute'
alias kgira='kubecolor get IngressRoute --all-namespaces'
alias keir='kubecolor edit IngressRoute'
alias kdir='kubecolor describe IngressRoute'
alias kdelir='kubecolor delete IngressRoute'
alias kgci='kubecolor get ClusterIssuer'
alias kgcer='kubecolor get certificate'
alias kdcer='kubecolor describe certificate'
alias kdcerr='kubecolor describe certificaterequest'


#### custom
alias gs='git status'
alias gh='git log'
gpsm(){
  git submodule init
  git submodule update
}
ssh-rm() {
  ssh-keygen -R $1
}
cert-decode() {
  openssl x509 -noout -text -in $1
}
alias kx='kubectx'


alias kcns='kubectl create ns'

# CronJob management.
alias kgj='kubecolor get job'
alias kdj='kubecolor describe job'
alias kdelj='kubecolor delete job'

alias kgcj='kubecolor get cronjob'
alias kdcj='kubecolor describe cronjob'
alias kdelcj='kubecolor delete cronjob'

alias kgrs='kubecolor get rs'
alias kdrs='kubecolor describe rs'
alias kdelrs='kubecolor delete rs'

alias kgvwc='kubecolor get ValidatingWebhookConfiguration'
alias kdvwc='kubecolor describe ValidatingWebhookConfiguration'
alias kdelvwc='kubecolor delete ValidatingWebhookConfiguration'

alias kgcmy='kubecolor get configmaps -oyaml'
alias kgsecy='kubecolor get secret -oyaml'
alias kgpy='kubecolor get pods -oyaml'
alias kgsy='kubecolor get service -oyaml'
alias kgiy='kubecolor get ingress -oyaml'

# prometheus
alias kgsma='kubectl get servicemonitor -A'
alias kgsm='kubectl get servicemonitor'
alias kgsmy='kubectl get servicemonitor -oyaml'
alias kdelsm='kubectl delete servicemonitor'
alias kdsm='kubectl describe servicemonitor'

alias kgpma='kubectl get podmonitor -A'
alias kgpm='kubectl get podmonitor'
alias kgpmy='kubectl get podmonitor -oyaml'
alias kdelpm='kubectl delete podmonitor'
alias kdpm='kubectl describe podmonitor'

alias kgpra='kubectl get prometheusRule -A'
alias kgpr='kubectl get prometheusRule'
alias kgpry='kubectl get prometheusRule -oyaml'
alias kdelpr='kubectl delete prometheusRule'
alias kdpr='kubectl describe prometheusRule'
