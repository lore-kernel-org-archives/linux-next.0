From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Mon, 18 Feb 2019 09:28:10 +1100
Message-ID: <20190218092810.0a46ad27@canb.auug.org.au>
References: <20190218092536.39375e84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/km8zEk8AgWkrbktC.BTp9yt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218092536.39375e84@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/km8zEk8AgWkrbktC.BTp9yt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Feb 2019 09:25:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Linus,
>=20
> In commit
>=20
>   a5a0bbca16cd ("pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins")
>=20
> Fixes tag
>=20
>   Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Ignore this, I am still half asleep :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/km8zEk8AgWkrbktC.BTp9yt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxp3/oACgkQAVBC80lX
0GyntAf/SmLdLoAIIcz0h75npYqagH6mADGu5DVXqWnhw/KzLKf0SukXKh5J8gIb
Y3YX7ph54+ytpPIklp3fmaD5IH0IMfl9kBpRMYWE7vcm+63Rhxe0c5mDnwIpKPSq
H0Vc8jBjhbAv4VC3uDqWHcFxQBQTRN3cMwtroYey/8ipH/nquo9IAjD+5VJB/lQS
qEFGB8CNF3wCu2DpZpqtBszpaHA3LlVtGwHLQA2rbfyKn+YEFJCAi4ch42tqNGFO
PrICjmoXSAXKEBcejTTqueZSFncKy8irTyA/PdLWQUH60YMKNnhFpo74GVG7DnLP
QjpC8HugjM2KYuo45Poh7WkaihJiyQ==
=wJ8v
-----END PGP SIGNATURE-----

--Sig_/km8zEk8AgWkrbktC.BTp9yt--
