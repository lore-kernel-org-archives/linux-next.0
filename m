From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Dec 11
Date: Wed, 12 Dec 2018 09:36:32 +1100
Message-ID: <20181212093632.774c0603@canb.auug.org.au>
References: <20181211182627.42b79e40@canb.auug.org.au>
        <20181211173851.GA29028@roeck-us.net>
        <20181211180437.GA28010@flashbox>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bm1qAIv6N5Tmq+0_b_6lQQO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211180437.GA28010@flashbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/bm1qAIv6N5Tmq+0_b_6lQQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 Dec 2018 11:04:37 -0700 Nathan Chancellor <natechancellor@gmail.=
com> wrote:
>
> On Tue, Dec 11, 2018 at 09:38:51AM -0800, Guenter Roeck wrote:
> > Build results:
> > 	total: 152 pass: 150 fail: 2
> > Failed builds:=20
> > 	arm:allmodconfig=20
> > 	arm64:allmodconfig=20
> > Qemu test results:
> > 	total: 337 pass: 137 fail: 200
> >=20
> > Build failures:
> >=20
> > arm:
> >=20
> > In file included from drivers/media/pci/ddbridge/ddbridge.h:22:0,
> >                  from drivers/media/pci/ddbridge/ddbridge-ci.c:19:
> > arch/arm/include/asm/irq.h:35:50: error: unknown type name 'cpumask_t'
> >  =20
>=20
> Just FYI, I noticed this one yesterday on next-20181210 and sent a patch:
> https://lore.kernel.org/linux-media/20181210233514.3069-1-natechancellor@=
gmail.com/

I have added that patch after the v4l-dvb tree for today.  (and cc'd
the v4l-dvb maintainer - who is also the author of the patch in the
Fixes tag ...)
--=20
Cheers,
Stephen Rothwell

--Sig_/bm1qAIv6N5Tmq+0_b_6lQQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwQO/AACgkQAVBC80lX
0GxxxQf+MpmrYFnkcVNJso5Fw/W3SRICtVE1gpAy7SoaKgk589XZpgOMlOPNf5EG
O8BD+6VagYhM4KzDdS3x/keWwth5M6Gfl2ycNbufJZYZuKLA0mjMH/R6XX5YT/zS
bxHUwniXQRfEIoeEOfyIN4ugas2vAm/upfCTKtTjC5DdQWuitZ26a5cnbU0MhWEc
bJow1UWHSeznJzLhLtMnyB0yDp4Pci0Pt6Hyx3C075wFqqwM4pMIdx8VtmGHEPWO
ePPzttady6Xb9jhp2s+7l33/FFmWJAEGs5xBaoQCx0nSzDZelWI11p5Dd6Ek2y0U
JL9vHfAl6N4ALU4+BgCOlMmtxBcYMA==
=9vE3
-----END PGP SIGNATURE-----

--Sig_/bm1qAIv6N5Tmq+0_b_6lQQO--
