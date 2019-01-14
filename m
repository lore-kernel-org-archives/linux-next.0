From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net tree
Date: Mon, 14 Jan 2019 15:15:55 +1100
Message-ID: <20190114151555.31c85f81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yf/8_zO68f+jchMjI852Q7E"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Taehee Yoo <ap420073@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yf/8_zO68f+jchMjI852Q7E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

ld: warning: orphan section `.bpfilter_umh' from `net/bpfilter/bpfilter_umh=
_blob.o' being placed in section `.bpfilter_umh'

Introduced by commit

  61fbf5933d42 ("net: bpfilter: restart bpfilter_umh when error occurred")

--=20
Cheers,
Stephen Rothwell

--Sig_/yf/8_zO68f+jchMjI852Q7E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw8DPsACgkQAVBC80lX
0GxZZAf+LKIiJM5K2/Z7NO8P6PCxpZoyEltYlQpGJKl00rc5DVktCV1mvgrYE0zQ
qfNeQcjLYilRLq5ZCNWs0eNRDRkJTLeC5iYDKBUTQHfpw9UddDxtKRaUMf5yZ1G7
N084G0Rq+PZ86B5Km7mZqFVjXcbSEIktwQPnsxTktoeAAs9KJXZhdjyBFZRkb2IQ
YxswZXqczM/xNx+eYhclAeFi7Y7sxeHlPPKEz2ppobmg3brl/LRxKihaaYy8JrQo
1EIwu+sJ3+SvsJEFtbyb3+xHY9QzhzHWGXyE9nzJL9Eaje3FU1lM6z+EiX3CCiRV
yvT7dkJF5CWg6idv61IPMDP25qiqxQ==
=ZJU/
-----END PGP SIGNATURE-----

--Sig_/yf/8_zO68f+jchMjI852Q7E--
