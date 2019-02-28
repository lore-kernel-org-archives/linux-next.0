From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the net-next tree
Date: Thu, 28 Feb 2019 15:52:01 +1100
Message-ID: <20190228155201.329a1fad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JyAC1TUGYkg3xe9svj/HL1K"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JyAC1TUGYkg3xe9svj/HL1K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/fsl-dpaa2/ethsw/ethsw.c

between commit:

  570b68c8ddde ("staging: fsl-dpaa2: ethsw: Handle SWITCHDEV_PORT_ATTR_SET")

from the net-next tree and commit:

  11f27765f611 ("staging: fsl-dpaa2: ethsw: Add missing netdevice check")

from the staging tree.

I fixed it up (the former is a superset of the latter) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/JyAC1TUGYkg3xe9svj/HL1K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx3aPEACgkQAVBC80lX
0Gx+1Af/XY5BPPNxunXMZml6YaUuyP+N/0nOxUeF9h28hRtJBXvyWvE+RCPfWB0p
9mrH+wa3XCkmyMAjxrtcDI96btwioE9GRFSDRO4ZXXwZp8eepfUXglDzBfuS4qS/
fHlDFvm4rRQ2NLsASmLzfqfMHDXPbaaMp7sCDV7OpeZbUD0Ps2/RVwodWqzT7Y4y
TyHb4uaNEgwaqng1BhwQev/LSWbUI2ZpUupEz4gk8O752RObvI9iPseXogQ6NF/p
n+LPTKSRMFapArvqFj9rN0Q8CsrlU+ant929VPLjH8VPNxBQE2h4xLQeSq45NcJ+
I26Xxhqd2YqwpaMqu2hpEteB47fstA==
=ScKE
-----END PGP SIGNATURE-----

--Sig_/JyAC1TUGYkg3xe9svj/HL1K--
