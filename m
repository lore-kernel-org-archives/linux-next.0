From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 2
Date: Fri, 3 May 2019 08:03:31 +1000
Message-ID: <20190503080331.0ccc2419@canb.auug.org.au>
References: <20190502201028.707453d8@canb.auug.org.au>
        <CADYN=9LHJpDyvA=3wkcqdS5f3kahD0vdXFY415k8UmLHMDzL+Q@mail.gmail.com>
        <20190502190845.GA19485@archlinux-i9>
        <0a28f5b8-296a-451c-c2f4-c0057833fb00@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LDFhNINO6Q+CN8C=9JPJzpA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0a28f5b8-296a-451c-c2f4-c0057833fb00@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, maxime.ripard@bootlin.com, andre.przywara@arm.com, samuel@sholland.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/LDFhNINO6Q+CN8C=9JPJzpA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 2 May 2019 22:09:49 +0200 Daniel Lezcano <daniel.lezcano@linaro.org=
> wrote:
>
> Yes, I picked the patch and it was merged it via the tip tree [1] as
> requested by Marc Zyngier [2] and notified [3].
>=20
> In any case, this patch should have go through my tree initially, so if
> it is found somewhere else that's wrong.
>=20
> I did a respin of my branch and pushed it again in case there was
> something wrong from it.

The patch ("clocksource/drivers/arch_timer: Workaround for Allwinner
A64 timer instability") was merged into v5.1-rc1 via the tip tree as
you say, however the version of your clockevents tree in yesterday's
linux-next was based on v5.0-rc1 and contained the patch again ...

Today's should be better.
--=20
Cheers,
Stephen Rothwell

--Sig_/LDFhNINO6Q+CN8C=9JPJzpA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzLaTMACgkQAVBC80lX
0GwK2gf/T46LsHptfQcVHZYq0BKp3GlqA/KAkpndiWhiqzVF4j12VWKizW7fskBG
jO6IQiEjlLugRilJxK8AH28UtkvETvLaiMeHBBGjxW4rvOpkkeVymsCZkVmGnNc/
3Ywm6kkQWQ8bn+h1jmeSKm35+kNepC7Xa9/ll5ParMz0bsBoeKQ+p8Au0uLroEva
DzGfgXq3m/5eihWwMlNcam7Kb6OjnN1+T9ArIg78y/UviaBvecBkzGsvJYJ07Nk1
dwjNZliVpesEDiDT1iFMGcStQ04SEhZ6Cu+F1cSvL+LRoA1Pyjscp7ITP5/NQLuz
mNJCgqfarwjbRYd8jPf/pXwpfT5q5w==
=+AWD
-----END PGP SIGNATURE-----

--Sig_/LDFhNINO6Q+CN8C=9JPJzpA--
