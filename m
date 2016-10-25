From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Date: Tue, 25 Oct 2016 12:41:39 +0200
Message-ID: <20161025104139.t62j4ccqsk7mq4ky@lukather>
References: <20161025112628.44493fd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="heegtteu2rn6f6vu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161025112628.44493fd6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--heegtteu2rn6f6vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 11:26:28AM +1100, Stephen Rothwell wrote:
> Hi Maxime,
>=20
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> ERROR (phandle_references): Reference to non-existent node or label "pwm1=
_pins_a"
> ERROR: Input tree has errors, aborting (use -f to force output)
> scripts/Makefile.lib:313: recipe for target 'arch/arm/boot/dts/ntc-gr8-ch=
ip-pro.dtb' failed
>=20
> Caused by commit
>=20
>   f49f86fa3b49 ("ARM: gr8: Add CHIP Pro support")
>=20
> I have used the sunxi tree from next-20161024 for today.

Ugh, sorry for that. The commit is fixed now...

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--heegtteu2rn6f6vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDzbjAAoJEBx+YmzsjxAgjiMP/RDWaHMOlOmcN3rHTcOYd+wm
74MvhV7Ccw0JZnF3qM0yxTGlurdaL1rFHJxnUlqZRcruodgthxkoIbDSYeUtAl0N
QsK27b99G+PJ2uEDcp2oTWgVwpkNKe/wNomJKHnPl1joj3YLb9wUGdH4thorCO9F
GFfCMwH1VRSpOWM0hPNwUMqILDdSrI+g7dy4eg2XNs3hrbUH/91vV+Yk8TS02YMG
UFuBcR+PUhn/U8oIDG2YHcQbRBnJpvMrTl+eaFTAf5X9bPWjGqMwBUPvu1w7w6XX
GHjL6oC4LLvUz6Xxh8jVceaiWeUsDGfmjRKzTW6MFYFab/sdBcrlZFKyw1Wm8+FJ
mpNg4KBVZEO//cxwagK66JM5qUNxqS4Nd8rFeV1HDSbmjsDJMmXCHuljxI3s0riu
WnhPf3vKCcyaVKsQnLMFBxEBEJpmZDeuWORnlCtNK0e3AZBZSr+2wk1y526n1HrJ
sHwlgIaSqJ5ZUKfvVODT/5FkvDyJDw6kXgTI+k6HxgLypngOLwWbDop3eRRWeG42
F1LJu+4melcqf2Oqh5q3yhg9gVewjBuFwMWZMG3vaiX1xSR/KUqTR5nf2dcxB7+A
OO8c6I4X+7XgKeQ5msGrJiSA7xo2iESSn7rcBL1Td26PRzkyo3Zvqpjz/lO3FCAw
pjW2w4G4PPtWLpfSbL8h
=JTlq
-----END PGP SIGNATURE-----

--heegtteu2rn6f6vu--
