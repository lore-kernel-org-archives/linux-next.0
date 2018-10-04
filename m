From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Thu, 4 Oct 2018 21:37:27 +0200
Message-ID: <20181004193727.qci3puitpxml26m5@flea>
References: <20181003072140.7c18d772@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ip7sy5d7luuc7gsk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181003072140.7c18d772@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--ip7sy5d7luuc7gsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Oct 03, 2018 at 07:21:40AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commits
>=20
>   6eeb4180d4b9 ("ARM: dts: sunxi: h3-h5: Add Bananapi M2+ v1.2 device tre=
es")
>   80c21c8c8b8d ("arm64: dts: allwinner: h5: Add device tree for Bananapi =
M2 Plus H5")
>   aa8fee415f46 ("ARM: dts: sun8i: h3: Split out non-SoC-specific parts of=
 Bananapi M2 Plus")
>   db9fd9d13e30 ("ARM: dts: sun8i: h3: bpi-m2-plus: Fix address for extern=
al RGMII Ethernet PHY")
>   6c700289a3e8 ("ARM: dts: sun8i: h3-h5: ir register size should be the w=
hole memory block")
>=20
> are missing a Signed-off-by from their committer.

I just sent a new PR with the SoB this time (and I just learnt that
git rebase rewrites the committer...)

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ip7sy5d7luuc7gsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu2a/YACgkQ0rTAlCFN
r3QSjw//YOXotRZpSpj9K1oCDqe2GxKumPai06ik3zbDbA58SHeB3zCAiFQufcC/
vhAqaaOJYu/1/nF7v/pa9eTlfDCKPDpGHo3RT2wrmFYffwH94icRL6BZF16aBqPs
qWQa4CdsdEEXcHTg7oKW5aFPdIIbfXVkkqzXHo3xkW/K+Dc1+gW9S4p3jG6Mkn2r
G8/UPaFLNUGrXRYcGgD0vTXx0BbVYcTqnKW3m/AbmVNnO2j9H2+IaOpCgSthaxK2
o4SW4r/So+cqfsS1U5df9eLpx5DR4D5p8JSxZNvlAqxeUr3eEoxiddM7iUPXsXEf
rlHvuHH48UaO5pPNkGKBFrH7SSI+skAo6hFX7vouQLiFUBVkTW+DrLEtr7rzDCQv
2DP4f/xXXSH0qUTQ1jtJ6dsoiiqfLPeu9q2iBQIw0hoZtbMfX83gkiKfGWvWwc8O
3CPLV/rStO7bELzwTZ8BNMQkSqCEBAPK86exzw/yh+CigPpReg0rbTujRd05sTb8
4tMTbjcZkxXTEanXBwRKTfe8X5hPpK+4j+oT5No9u3vhYivrYiw/TOiz8pHOtGzj
EXV0mF9ukwJ4Jj2Zy+wduw8ZTnIUBTF/RViHPyfJTzPHMtYWw0Ccr3oMgI/YOb4M
sCHv0huAYJdDl1Jn9VK989f+mkcO3cN0PEKV2MTrduApRdWnjWk=
=UvdW
-----END PGP SIGNATURE-----

--ip7sy5d7luuc7gsk--
