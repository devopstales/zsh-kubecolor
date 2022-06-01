# fzf
alias kgpn='kubectl get pods --no-headers --output=custom-columns=NAME:.metadata.name'
alias kgprn='kubectl get pods --no-headers --field-selector=status.phase=Running --output=custom-columns=NAME:.metadata.name'
alias kep='kubectl exec -ti "$(kgprn | fzf --prompt=exec-pod)" bash'
alias klp='kubectl logs "$(kgprn | fzf --prompt=describe-pod:)"'
alias kgpvcn='kubectl get pvc --no-headers --output=custom-columns=NAME:.metadata.name'
