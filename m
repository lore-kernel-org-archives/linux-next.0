From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the net-next tree
Date: Thu, 15 Mar 2018 18:35:31 +1100
Message-ID: <20180315183531.0e987f82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DH7i9N3rfEpuhujVBpBjLDd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denys Vlasenko <dvlasenk@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DH7i9N3rfEpuhujVBpBjLDd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/irda/net/af_irda.c

between commit:

  9b2c45d479d0 ("net: make getname() functions return length rather than us=
e int* parameter")

from the net-next tree and commit:

  d64c2a76123f ("staging: irda: remove the irda network stack and drivers")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DH7i9N3rfEpuhujVBpBjLDd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqIkMACgkQAVBC80lX
0Gx97wf+My6j91q7HyvMD6sBNz7Tml29Q8ibMCk/b5NcXZVWB99HeVPR/yuOEkGl
F6OYC+n5DDYNLStrOQnqnm1m8pWpsSTmly6xdX1DV+vfKMC1Po9adc2UWftdfKXM
dBfAaLwXOwHyZ69YKlJ7JXmZCVS97FCVPpef3OAS83tzV5GzyLgE2lKL2xMCQAdV
Er5hxuUnPuLxv9Bfgulg9V9VK01vTP5RO2wJqh5bJCQ08Ox01CIfFlClqY2yNSN8
4BLleYzaTxxoOQERRTFl/CAfBZ6Njay1xTtYmE7QhO6jv+7oye7WEdiluDEQ23lQ
yjSzeNj/ToRN7RITIuP8W9PrKTI23Q==
=5jAI
-----END PGP SIGNATURE-----

--Sig_/DH7i9N3rfEpuhujVBpBjLDd--
