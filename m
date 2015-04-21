From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 06:56:40 -0300
Message-ID: <20150421065640.02f14142@recife.lan>
References: <20150421115409.73e6a066@canb.auug.org.au>
	<5336539.Ny4ylH3Nve@avalon>
	<20150421180243.15b11537@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/oOcc+n0/q3Z26YDmqaXTkBF"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40800 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754078AbbDUMWZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2015 08:22:25 -0400
In-Reply-To: <20150421180243.15b11537@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Boris Brezillion <boris.brezillon@free-electrons.com>, Hyun Kwon <hyun.kwon@xilinx.com>

--Sig_/oOcc+n0/q3Z26YDmqaXTkBF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Tue, 21 Apr 2015 18:02:43 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Laurent,
>=20
> On Tue, 21 Apr 2015 10:49:52 +0300 Laurent Pinchart <laurent.pinchart@ide=
asonboard.com> wrote:
> >=20
> > >  +#define MEDIA_BUS_FMT_YUV10_1X30              0x2016
> > >  +#define MEDIA_BUS_FMT_AYUV8_1X32              0x2017
> > >  +#define MEDIA_BUS_FMT_UYVY12_2X12             0x201c
> > >  +#define MEDIA_BUS_FMT_VYUY12_2X12             0x201d
> > >  +#define MEDIA_BUS_FMT_YUYV12_2X12             0x201e
> > >  +#define MEDIA_BUS_FMT_YVYU12_2X12             0x201f
> >=20
> > The above 6 lines introduce duplicate defines, you can remove them.
>=20
> OK, thanks, done for tomorrow.  Though hopefully all this will be
> resolved soon.

I think that the best is for me to merge from the DRM branch that Linus
picked, and solve the conflict there.

This way, it should be a way easier for Linus to pick it, and not
manually solve those conflicts with are not trivial.

Laurent/Philipp,

Please double-check if everything went fine on my conflict solving.
I'm pushing it at branch "fixes" at the media development tree:
	git://linuxtv.org/media_tree.git fixes
=09
In any case, I double-checked that it is compiling and it is producing the
media DocBook.

PS.: I intend to send this latter today for being merged upstream.

=09
Thanks,
Mauro

--Sig_/oOcc+n0/q3Z26YDmqaXTkBF
Content-Type: application/pgp-signature
Content-Description: Assinatura digital OpenPGP

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVNh7gAAoJEAhfPr2O5OEVPJwQAKKQQiK7f7pT+AbU/7KxqSPK
DXQsx1uCsfupKS3KoN3tWHxZHGFdL38GrIQqvBMbBATcCli8PXkn3DFlMy15IltT
4Ov30w0bKQrHtgqSBNMCXvkgbvM2GkO18BWjk0SqlLNxG43qYjis8DpvUieC3d8v
p/wDMg3h2dedlKqvtoaatnNWsnD1Y0NnYlpD09LEp76johD0NgNKF5rpaNy4dBeT
B3tTJygt4K8EQX7oju3qOBfeEVkZs32lqdAl82/bosAS8YBagC2cRRczgNUxxRL8
pKA+XsVxHoMmuxThD0yy2j+ecIcchYBoB785EgrK1xBMlECzs2CuBE8uPVxAHlfn
0gB7TZQOQfi8sL5AeK8sTMXW5Kw3c1rm/T/HoCm3ID5fPDAktqRjTrilegvbqAEU
c+siOXDY60VamhvGrknjFlCVti12n2/wVskZKj3BmKhBhGv6owq+Yy2ZG0WrUYuj
UNb9dkn9cCmPRISPSq74g172psFs1a4fsYAJCJIFjvWWB0Ikum2jNc7pSxprE5lt
iETg8vaZH+MeI4vpLXatMioe7jlYP9cELy+CWYHvmr0JEGpgA/ias8d1Mcxy6iof
o2s18zjCaHg12+8bjqbiep0H6lfVCqCScr9VkLW+SUANDyA2iTY52Z3zzUzsdMoA
BpOsxR4GWEmi6dv8RiMR
=kRmR
-----END PGP SIGNATURE-----

--Sig_/oOcc+n0/q3Z26YDmqaXTkBF--
