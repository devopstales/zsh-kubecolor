# flux
alias f=flux
alias fr="flux reconcile source git flux-system"
alias fgaa="flux get all -A"
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
