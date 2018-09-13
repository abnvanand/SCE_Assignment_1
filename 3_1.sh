awk 'found[$0]==0 {print$0} {++found[$0]}'
