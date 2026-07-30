# Vibe Starter

## Feynman

feynman serve --host 0.0.0.0

host visit localhost:xxxx -> docker forward via port bridge to container's eth0\
if container server listen on 0.0.0.0 -> it will bind to all network interfaces\
if container server listen on 127.0.0.1(default) -> it will bind to local
access only(inside container)
