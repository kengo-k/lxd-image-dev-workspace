# コンテナを起動する
launch:
	lxc network set lxdbr0 ipv4.address 192.168.123.1/24
	lxc launch ubuntu:22.04 workspace \
		-c security.nesting=true \
		-c security.privileged=true \
		-c user.user-data="$$(cat cloud-init.yaml)"
	lxc config device override workspace eth0 ipv4.address=192.168.123.2
	lxc config device add workspace init disk source=$$PWD/init path=/tmp/init
	./check_status.sh

# 各種必要なツール等をインストール
install:
	lxc exec workspace -- sudo -u workspace-user /tmp/init/init.sh
	lxc exec workspace -- sudo -u workspace-user /tmp/init/install_asdf.sh
	lxc exec workspace -- /tmp/init/install_docker.sh
	lxc file push .zshrc workspace/home/workspace-user/.zshrc

ssh:
	echo ">>> setup ssh keyfiles..."
	lxc config device add workspace ssh disk source=$$HOME/.ssh path=/home/workspace-user/.ssh

# cloud-initの初期化処理のステータスをチェックする
status:
	lxc exec workspace -- cloud-init status

# コンテナを停止してから削除
clean:
	lxc stop workspace
	lxc delete workspace

# コンテナに接続する
sh:
	lxc exec workspace -- su - workspace-user
