From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 12 Oct 2018 10:53:29 +1100
Message-ID: <20181012105329.40678d21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iqkQZOJoNghT1_bRlwNcXF."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iqkQZOJoNghT1_bRlwNcXF.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/rxrpc/input.c

between commit:

  5271953cad31 ("rxrpc: Use the UDP encap_rcv hook")

from the net tree and commit:

  d2944b1c66a5 ("rxrpc: Use rxrpc_free_skb() rather than rxrpc_lose_skb()")

from the net-next tree.

I fixed it up (I used the net tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/iqkQZOJoNghT1_bRlwNcXF.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/4nkACgkQAVBC80lX
0GxLKQf/SLpImoxPw+Hzjjcw8tD+Ha4tMMS01uXjx3p4G0NLyfKsRyVqj+ysO+nb
oHpf98JMC62dSsWtN1RuUnCtFEXTEBSa6x/dbh7s8hnRjA2+AtARxReXfeGVELrd
WhzZqUPN9R/Y7abQFDqfXffggtkcpn5RwiD+UnzBa9w8JKiIY8eAKZYx+7/YjBh9
oRr2wwHgC/rVyOc0AIqedW90IJJ/9N1X96/P7BicMY1m0/GZiKxgrzYcUgb8wP4s
8kMtmv2BJTengfOj5AubN5vac1i6xK8ydgnWHD3lC3IokWxxCan5mHP5KIQ/TSHl
52wy4oh0iwf1IvrIPJW37HbN4nYW7g==
=DA2r
-----END PGP SIGNATURE-----

--Sig_/iqkQZOJoNghT1_bRlwNcXF.--
