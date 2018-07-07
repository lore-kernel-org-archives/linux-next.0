From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Sat, 7 Jul 2018 22:03:39 +1000
Message-ID: <20180707220339.3f90340a@canb.auug.org.au>
References: <20180706095633.676b0229@canb.auug.org.au>
        <20180707.203016.623173685153821356.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2nIqRkEDViUg+WKQ9WiTLaV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180707.203016.623173685153821356.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, moshe@mellanox.com, jiri@mellanox.com, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/2nIqRkEDViUg+WKQ9WiTLaV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sat, 07 Jul 2018 20:30:16 +0900 (KST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 6 Jul 2018 09:56:33 +1000
>=20
> > After merging the net-next tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > In file included from include/net/dsa.h:24:0,
> >                  from include/linux/platform_data/b53.h:23,
> >                  from drivers/net/dsa/b53/b53_spi.c:25:
> > include/net/devlink.h: In function 'devlink_param_value_changed':
> > include/net/devlink.h:771:9: warning: 'return' with a value, in functio=
n returning void
> >   return -EOPNOTSUPP;
> >          ^
> > include/net/devlink.h:769:1: note: declared here
> >  devlink_param_value_changed(struct devlink *devlink, u32 param_id) =20
>  ...
> > Introduced by commit
> >=20
> >   ea601e170988 ("devlink: Add devlink notifications support for params"=
) =20
>=20
> Thanks Stephen, this should be fixes now.

Great, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/2nIqRkEDViUg+WKQ9WiTLaV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltArBsACgkQAVBC80lX
0Gyo8gf/VQEldn53O3rgoG3/uS5Wdw0FvvEsITaEGsVEHRjsUTbyaQj1qGvHwOYX
2LnorbAbWnyQj3dfewNXUi5LToDc9zg4b12mGZfLRKocetZpxqUjTQyrMrnI2EXs
ea9YsGfEvJdscOh+8cuQUxMm50rKRTg0mlek6ZitkDV4kU6AOoY+ZTHlXedutHcs
o0+9KGJL5utTnWCQfOGxQ0gANeDqXazVL96Rwk+bRO8red+FLW2SjdFMes9MaI0e
lLy1c9WMHTQ9b0VajgxfdOowOMD+qDdBf4CKqKfFhWzZMmkIqpIF7OieLmpTARsg
oSROm/GYUPfhIdFvtafeTkat7IzQ4g==
=9qyb
-----END PGP SIGNATURE-----

--Sig_/2nIqRkEDViUg+WKQ9WiTLaV--
