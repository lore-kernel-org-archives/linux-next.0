From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 5 Dec 2018 11:33:33 +1100
Message-ID: <20181205113333.20f50e15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mi8K.qA=cKa3=9.u9HgMqZ8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/mi8K.qA=cKa3=9.u9HgMqZ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/phy_device.c

between commit:

  d2a36971ef59 ("net: phy: don't allow __set_phy_supported to add unsupport=
ed modes")

from the net tree and commits:

  3c1bcc8614db ("net: ethernet: Convert phydev advertize and supported from=
 u32 to link mode")
  6915bf3b002b ("net: phy: don't allow __set_phy_supported to add unsupport=
ed modes")

from the net-next tree.

I fixed it up (I just used the net-next tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mi8K.qA=cKa3=9.u9HgMqZ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwHHN0ACgkQAVBC80lX
0GyOwAf9GVsbv9hqRcz7DQg2IjyDk/L7HF2lRGRyuqrdDBB1AIxUgakT1ov8V3Fh
Xhn3nDnUqgZ2JsDPBrWOoMZaZziNpQrHfvqSEygbcLbC7b5ZJtJwEuwsWZIfUfXS
wTGBAYhtpSPQ0oEruOowMHn0JH3XioJKGZKcasmjSDRwNLsTePMDFDbNKQi49aky
K5Ah92LCTZf4D6KMVFQk/Bbb40De2rTPBhsmkfWM5lIYa/FrcSi+IitR5c/ecpMS
aMTAf8uHABG91/fNSoEXGnbSNcYB75Wtmp0kiAE0lPzDeGFvWnqbWx1pJttnXUbg
rIgzzRywuK18174+5lkhc16pwoY00A==
=BWvI
-----END PGP SIGNATURE-----

--Sig_/mi8K.qA=cKa3=9.u9HgMqZ8--
