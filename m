From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the arm-soc tree
Date: Tue, 27 May 2014 15:17:58 +1000
Message-ID: <20140527151758.00163ea0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6822VvtULxHLZaIHam/ginR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlos Garcia <carlos@cgarcia.org>, Rajendra Nayak <rnayak@ti.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6822VvtULxHLZaIHam/ginR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
Documentation/devicetree/bindings/arm/omap/omap.txt between commit
38b248db60e3 ("ARM: dts: Add support for DRA72x family of devices")
from the arm-soc tree and commit c98be0c96db0 ("doc: spelling error
changes") from the trivial tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/arm/omap/omap.txt
index 189baba40cd6,aa71962352ff..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/omap.txt
+++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
@@@ -126,11 -114,5 +126,11 @@@ Boards
  - AM43x EPOS EVM
    compatible =3D "ti,am43x-epos-evm", "ti,am4372", "ti,am43"
 =20
 -- DRA7 EVM:  Software Development Board for DRA7XX
 -  compatible =3D "ti,dra7-evm", "ti,dra7"
 +- AM437x GP EVM
 +  compatible =3D "ti,am437x-gp-evm", "ti,am4372", "ti,am43"
 +
- - DRA742 EVM:  Software Developement Board for DRA742
++- DRA742 EVM:  Software Development Board for DRA742
 +  compatible =3D "ti,dra7-evm", "ti,dra742", "ti,dra74", "ti,dra7"
 +
 +- DRA722 EVM: Software Development Board for DRA722
 +  compatible =3D "ti,dra72-evm", "ti,dra722", "ti,dra72", "ti,dra7"

--Sig_/6822VvtULxHLZaIHam/ginR
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJThCANAAoJEMDTa8Ir7ZwVCtwP/1xFsjqLlcOGHpqJBz0o03e6
n+zmZi+eEXxE0poUCi/Skj8y9WZIKt5weYAlM7mvzPz1IuYPpawlwx/RAhDL9zHa
MHppFKzAKlyuHF5kid0lYs1jRzhivdreBRrdsqKJvbIIMQMJd3cRMCRrgGZ0Jb6U
lVOr6zeI7OLuXwIHYCEw4u7P+mLnwK0HlCnn0iQZVoqLE/rl2QZPxJMo3mnJ6Wlz
9pLhlYtia+0e1f1AzI7uCrx1KsjKyJ7fdrzqyFN6MuY0fe1VH67U4IzKX+MrgnYJ
ZNR3yc2Nabku1FmbAn+TTDKkfYv4uie9Wdcstk4Y1JuSNeY8ApDpZUjhRSLqZCKJ
dsNpeOUQ8+5U4jTfqygZIz1VsEfyHVf33UvWScE0lvCQ1Q3KSeeFkdUezprJ4pGH
HXdGkbYjO+/mRpRxH0yNQ/LjW6VG1BaJ5u2P0QR0AHBlFMcQFELiV3Zs1FiOStkr
ysGbiuYxBrijqmJz+OSZibmtN2v6oC6NnJLHSj2cvZ9VwFZMPEePPxVeQEPOEP4I
Q7pMkS84YDXm2UITT/qgYQxAXUItyMEHhz1GG4j8IMrsT+uK00sbZgvQwZpCjZw3
uGZJ099wT+QERhkuhUW/mP/GM4I7Bdq2kXpE1zaTQXobN+m2pf8m6bBR5KEyk69t
E5EiUYki8+bttDJ1ct69
=PUw2
-----END PGP SIGNATURE-----

--Sig_/6822VvtULxHLZaIHam/ginR--
