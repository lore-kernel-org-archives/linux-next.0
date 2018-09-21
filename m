From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 21 Sep 2018 10:24:52 +1000
Message-ID: <20180921102452.3dc420eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oQeBqtk5vkmsq5NRg7ZB/pV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>, Simon Wunderlich <sw@simonwunderlich.de>
List-Id: linux-next.vger.kernel.org

--Sig_/oQeBqtk5vkmsq5NRg7ZB/pV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/batman-adv/main.h

between commit:

  dabeb13eee81 ("batman-adv: Increase version number to 2018.3")

from the net tree and commit:

  138c72efbd5d ("batman-adv: Start new development cycle")

from the net-next tree.

I fixed it up (I used the net-next tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/oQeBqtk5vkmsq5NRg7ZB/pV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlukOlQACgkQAVBC80lX
0GygNAf9GTl6GKZUf94KAp77yBer0PyPtBCpvEwjl5omlFQ+q3t2j0MeH+8xSt2d
n9O+E4xjcA01AR4DjWW80V/HS0elKA2Mt3fum5Whzo0pG+zor04Vjc5S6KDH+XXC
lPSfTnFqrQQprPe45UHdJ4A3OifvPDJ4yaBuYZT1SMvED+gnOqFdnOq/cx0bhl6y
CPpCSOlwyVYaOP3Z3duS7DROQ+ZiagQzjKYHpk0usvJI1LMk8sJ1bbiAVgL55qZW
+rkDL0u4rWP54yY3wZhaIZIQ3IazwjonaJTsjPU06gneMKssTAlgNYDisrJcYsUu
Ikysj+n4qtOuF08pMuie1bGzzTEHtg==
=KFIg
-----END PGP SIGNATURE-----

--Sig_/oQeBqtk5vkmsq5NRg7ZB/pV--
