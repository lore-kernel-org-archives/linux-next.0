From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 31 May 2019 10:25:53 +1000
Message-ID: <20190531102553.21963774@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9nWRv0t=KTrRSG3exrmFxVh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9nWRv0t=KTrRSG3exrmFxVh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/phylink.c

between commit:

  c678726305b9 ("net: phylink: ensure consistent phy interface mode")

from the net tree and commit:

  27755ff88c0e ("net: phylink: Add phylink_mac_link_{up, down} wrapper func=
tions")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/phy/phylink.c
index 9044b95d2afe,68d0a89c52be..000000000000
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@@ -399,6 -414,36 +418,36 @@@ static const char *phylink_pause_to_str
  	}
  }
 =20
+ static void phylink_mac_link_up(struct phylink *pl,
+ 				struct phylink_link_state link_state)
+ {
+ 	struct net_device *ndev =3D pl->netdev;
+=20
++	pl->cur_interface =3D link_state.interface;
+ 	pl->ops->mac_link_up(pl->config, pl->link_an_mode,
 -			     pl->phy_state.interface,
 -			     pl->phydev);
++			     pl->cur_interface, pl->phydev);
+=20
+ 	if (ndev)
+ 		netif_carrier_on(ndev);
+=20
+ 	phylink_info(pl,
+ 		     "Link is Up - %s/%s - flow control %s\n",
+ 		     phy_speed_to_str(link_state.speed),
+ 		     phy_duplex_to_str(link_state.duplex),
+ 		     phylink_pause_to_str(link_state.pause));
+ }
+=20
+ static void phylink_mac_link_down(struct phylink *pl)
+ {
+ 	struct net_device *ndev =3D pl->netdev;
+=20
+ 	if (ndev)
+ 		netif_carrier_off(ndev);
+ 	pl->ops->mac_link_down(pl->config, pl->link_an_mode,
 -			       pl->phy_state.interface);
++			       pl->cur_interface);
+ 	phylink_info(pl, "Link is Down\n");
+ }
+=20
  static void phylink_resolve(struct work_struct *w)
  {
  	struct phylink *pl =3D container_of(w, struct phylink, resolve);

--Sig_/9nWRv0t=KTrRSG3exrmFxVh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwdJEACgkQAVBC80lX
0Gwgrwf/Yd0UmZuflVIpQOy57opRiCEoFfskS3ssDSvWIE1D29u5OwYilAsLkarE
bNkpEnCfIatYOyFrZMLnq7IwKm1qlvbdEONHvEU/kCEsWUbF1pLC+4i6Gyh/a3u4
bP03SbPPra5r2M4E+/kjadVo2sRO7vHfBAaEZkVv7245IB646TUA6wRSqY+v8bRa
qDDiMIbSSoo8ML0SCDUkVJp+Ga5M0BlFOfzHGv+N0biSsUocl/H5rT+14N6mPv5T
bJ5PTcuF2Kein0qKKkwCwPaeVfhDFhNKjI/P1XFYns0HnBHyhPYQx/qnGBnhkYPx
Ys8zcwK5YtIQQc6WOl80KU/ouncFDw==
=WZjm
-----END PGP SIGNATURE-----

--Sig_/9nWRv0t=KTrRSG3exrmFxVh--
