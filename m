From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the omap-fixes tree
Date: Wed, 23 Jan 2019 16:32:09 +1100
Message-ID: <20190123163209.6187fe78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lngOp2KCqMP11/jq7hfbJ/q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiko Schocher <hs@denx.de>, Arthur Demchenkov <spinal.by@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lngOp2KCqMP11/jq7hfbJ/q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tony,

In commit

  5a1826e1b175 ("ARM: dts: am335x-shc.dts: fix wrong cd pin level")

Fixes tag

  Fixes: e63201f19438 ("mmc: omap_hsmmc: Delete platform data

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  0b30afcb8948 ("ARM: dts: n900: fix mmc1 card detect gpio polarity")

Fixes tag

  Fixes: e63201f19438 ("mmc: omap_hsmmc: Delete platform data GPIO

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags across more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/lngOp2KCqMP11/jq7hfbJ/q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxH/FkACgkQAVBC80lX
0GwZcgf9H2XAWDGWy18PBxQiHa33tJCEXc/jWTiT9oEkM6JsYPNlKAB6S0O3vwro
ccanxmURPWXOfhzRjEZai3eYHZ4dE4womGkoCtW1ARQDPnx3Wjdvx8jaWpfDLmE4
vjAUGnRAs5RTw2pbBDsXRjvMOxuG/TBVRA/hi5ZSAz0/shGAXSdRMouwsXhx2kPt
lZFg3u5c/BP30DB1CmoX4iooOOB9FUiBv1KCVhGW4GKb5nw9mw3KwnQZ+WmcLUsx
rqdYTuZMCe/ph2wQajZmNaPITOHLIWpH26fvwSmdYk1aB78v6ejRct7g2/pO2IqM
AjUDj8rZ+jXw+ZFJvekJpHZF5XKQnQ==
=64lW
-----END PGP SIGNATURE-----

--Sig_/lngOp2KCqMP11/jq7hfbJ/q--
