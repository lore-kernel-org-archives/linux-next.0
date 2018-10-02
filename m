From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the regulator tree
Date: Tue, 2 Oct 2018 16:25:51 +1000
Message-ID: <20181002162551.29b8c977@canb.auug.org.au>
References: <20181002130748.61e33ad1@canb.auug.org.au>
        <20181002061644.GC9389@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OKcjSmwS72v=RSZLJnSlLC6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002061644.GC9389@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/OKcjSmwS72v=RSZLJnSlLC6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matti,

On Tue, 2 Oct 2018 09:16:44 +0300 Matti Vaittinen <matti.vaittinen@fi.rohme=
urope.com> wrote:
>
> On Tue, Oct 02, 2018 at 01:07:48PM +1000, Stephen Rothwell wrote:
> > After merging the regulator tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > drivers/mfd/rohm-bd718x7.c: In function 'bd718xx_i2c_probe':
> > drivers/mfd/rohm-bd718x7.c:101:23: warning: cast from pointer to intege=
r of different size [-Wpointer-to-int-cast]
> >   bd718xx->chip_type =3D (unsigned int) =20
>=20
> I am pretty sure the last patch version corrected this to
> +       bd71837->chip_type =3D (unsigned int)(uintptr_t)
> +                               of_device_get_match_data(&i2c->dev);
>=20
> is it possible one of the earlier versions has accidentally been
> applied? Should I create patch on top of the last regulator tree or what
> is the simplest way fix this?

Sorry, this came from commit

  dd2be639f4a9 ("regulator/mfd: bd718xx: rename bd71837/bd71847 common inst=
ances")

which is later than the commit I noted.  In this later commit, this happens:

-	bd71837->chip_irq =3D i2c->irq;
-	bd71837->chip_type =3D (unsigned int)(uintptr_t)
+	bd718xx->chip_irq =3D i2c->irq;
+	bd718xx->chip_type =3D (unsigned int)
 				of_device_get_match_data(&i2c->dev);

--=20
Cheers,
Stephen Rothwell

--Sig_/OKcjSmwS72v=RSZLJnSlLC6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzD28ACgkQAVBC80lX
0GyhAgf+K1pac+QoUVty7V2wpdLYm7VaF4WzxKE9iea6baz2mOCQFfclTPCCTw9N
RUXNHjxqlG+Z8mBXDzhbr949EB2CM4YPyUR5g24Jr/aG65VEoV5vJ+RWIn8PE9be
Q6LjJE0GJu3QVq5c1QYxz2SKKreidLiaC8kYHCxmgr/z42N3qyXREfPGxWX/rOT8
R58Y5JDLx+NgHagahOqQKDpmNwZKFqTueDlZ90afN9gs6cpiGVJo6rQIx7LAEpVk
Yopa15LsjjLFTt8JAkpdF1Ep+G8OCB/qBEsvDgbI5QGNWGKSSrsK6Jd9upD+Da3h
H/KaeOfSmM1FOGuPAywA44yzTyEqig==
=pqAU
-----END PGP SIGNATURE-----

--Sig_/OKcjSmwS72v=RSZLJnSlLC6--
