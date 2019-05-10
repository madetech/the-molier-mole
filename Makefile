HOST_KEY_COMMENT ?= 'example.org'

generate-hostkeys: hostkeys/ed25519 hostkeys/rsa hostkeys/ecdsa

hostkeys/ed25519: hostkeys
	ssh-keygen -t ed25519 -N '' -f hostkeys/ed25519 -C '$(HOST_KEY_COMMENT)'

hostkeys/rsa: hostkeys
	ssh-keygen -b 4096 -t rsa -N '' -f hostkeys/rsa -C '$(HOST_KEY_COMMENT)'

hostkeys/ecdsa: hostkeys
	ssh-keygen -b 521 -t ecdsa -N '' -f hostkeys/ecdsa -C '$(HOST_KEY_COMMENT)'

hostkeys:
	mkdir hostkeys

clean:
	rm -rf hostkeys

run: generate-hostkeys
	./scripts/run-dev.sh
