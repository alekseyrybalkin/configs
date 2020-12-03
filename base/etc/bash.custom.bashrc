export TOUCHPAD_DEVICE="SynPS/2 Synaptics TouchPad"
export WIFI_DEVICE=wlp3s0
export WIRED_DEVICE=enp0s25

function magnet() {
    echo "magnet:?xt=urn:btih:${1}&dn=Torrent&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Fopentor.org%3A2710&tr=udp%3A%2F%2Ftracker.ccc.de%3A80&tr=udp%3A%2F%2Ftracker.blackunicorn.xyz%3A6969&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969"
}

function curl_wget() {
    curl -L -o `basename ${1}` ${@}
}

# user- and host-specific settings
if [ "${USER}" == "rybalkin" ]; then
    export XDG_CACHE_HOME=/tmp/devnull/.${USER}-cache
    export XDG_DATA_HOME=/tmp/devnull/.${USER}-cache/data

    umask 027

    export http_proxy=http://127.0.0.1:8118
    export HTTP_PROXY=${http_proxy}
    export https_proxy=${http_proxy}
    export HTTPS_PROXY=${http_proxy}

    export GPGKEY=4D8CAE8DB5B76A04F7199BC65B89C7585CA1EB8A
    export DEBFULLNAME='Aleksey Rybalkin'
    export DEBEMAIL='aleksey@rybalkin.org'

    export CLOUD_DOMAIN='rybalkin.org'
    export CLOUD_USER='aleksey'
    export CLOUD=${CLOUD_USER}@${CLOUD_DOMAIN}
    export PASSPHRASE_FILE=~/.data/secrets/old.encrypt.key

    alias prebackup="sudo systemctl stop hproxy-http syncema.timer srcfetcher.timer hckrnews-update.timer relmon.timer"
    alias postbackup="sudo systemctl start hproxy-http syncema.timer srcfetcher.timer hckrnews-update.timer relmon.timer"
    alias encri="gpg --batch -c --passphrase-fd 3 3<${PASSPHRASE_FILE}"
    alias decri="gpg --batch --passphrase-fd 3 3<${PASSPHRASE_FILE}"

    function seagate_mount() {
        sudo cryptsetup --key-file=/home/rybalkin/.data/secrets/seagate.key open /dev/sdb1 seagate
        mount /mnt/seagate
    }

    function seagate_umount() {
        umount /mnt/seagate
        sudo cryptsetup close seagate
    }
fi
