From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the net-next tree
Date: Fri, 7 Dec 2018 15:47:07 +1100
Message-ID: <20181207154707.35322397@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wPoC9+VwNm323wDY0paqyPS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wPoC9+VwNm323wDY0paqyPS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got conflicts in:

  net/bridge/br_mdb.c
  net/bridge/br_multicast.c

between commits:

  19e3a9c90c53 ("net: bridge: convert multicast to generic rhashtable")
  4329596cb10d ("net: bridge: multicast: use non-bh rcu flavor")

from the net-next tree and commit:

  1a56f7d53b5c ("net/bridge: Replace call_rcu_bh() and rcu_barrier_bh()")

from the rcu tree.

I fixed it up (I used the versions form net-next) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wPoC9+VwNm323wDY0paqyPS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJ+0sACgkQAVBC80lX
0GwmZwf+Pwk/3IDVvgxuOUSXhAb61M+sIxwVknZ3PcrMzTNayld50mAO/OyzBUjA
oyop6qziWVU0TT4qH1eaogkxLIQtA2k+GGBnQr6sAu2dfPjZmuRtsdECdwx39LrD
LRWlAELLO7woL6JbTAq7gUZhZYHsg2KU7ke13YTuuC397PVxdFLIyZr1gs5GJzUc
YeTye7XYdHqRJXe1Hva7rfufJHtvtZdcsYM7T9YhWiJ749R+IN5IRPX9ZBFGtIJe
iVcuURcIgyrnq0PHODYZdgZ48YoIqcX/zB+2zoQlRu/V5dtee+ncYc9oNKsKWH7Q
AosvURxe0zpC8VCRaO6h1GLFnhGD0Q==
=PcQx
-----END PGP SIGNATURE-----

--Sig_/wPoC9+VwNm323wDY0paqyPS--
