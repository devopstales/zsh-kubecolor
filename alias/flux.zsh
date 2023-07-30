# flux
alias f=flux
alias fr="flux reconcile source git flux-system"
alias fgap="flux get alert-providers"
alias fgapa="flux get alert-providers -A"
alias fgal="flux get alerts"
alias fgala="flux get alerts -A"
alias fga="flux get all"
alias fgaa="flux get all -A"
alias fgk="flux get kustomizations"
alias fgka="flux get kustomizations -A"
alias fghr="flux get helmreleases"
alias fghra="flux get helmreleases -A"
alias fgi="flux get images"
alias fgia="flux get images -A"
alias fgr="flux get receivers"
alias fgra="flux get receivers -A"
alias fgs="flux get sources"
alias fgsa="flux get sources -A"
function fshr() {
	flux suspend hr $1 -n $2
}
function frhr() {
	flux resume hr $1 -n $2
}
alias kgk="kg kustomization"
alias kgka="kg kustomization -A"
alias kdk="kd kustomization"
alias kdelk="kdel kustomization"
alias kghr="kg hr"
alias kghra="kg hr -A"
alias kdhr="kd hr"
alias kdelhr="kdel hr"
alias kghc="kg hc"
alias kghca="kg hc -A"
alias kdhc="kd hc"
alias kdelhc="kdel hc"
alias kghlr="kg HelmRepository"
alias kghlra="kg HelmRepository -A"
alias kdhlr="kd HelmRepository"
alias kdelhlr="kdel HelmRepository"
