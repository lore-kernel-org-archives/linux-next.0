From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 18:02:43 +1000
Message-ID: <20150421180243.15b11537@canb.auug.org.au>
References: <20150421115409.73e6a066@canb.auug.org.au>
	<5336539.Ny4ylH3Nve@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0FvtHsZk_4Di.VV/6qA+eTA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41379 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbbDUICv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2015 04:02:51 -0400
In-Reply-To: <5336539.Ny4ylH3Nve@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Boris Brezillion <boris.brezillon@free-electrons.com>, Hyun Kwon <hyun.kwon@xilinx.com>

--Sig_/0FvtHsZk_4Di.VV/6qA+eTA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, 21 Apr 2015 10:49:52 +0300 Laurent Pinchart <laurent.pinchart@ideas=
onboard.com> wrote:
>=20
> >  +#define MEDIA_BUS_FMT_YUV10_1X30              0x2016
> >  +#define MEDIA_BUS_FMT_AYUV8_1X32              0x2017
> >  +#define MEDIA_BUS_FMT_UYVY12_2X12             0x201c
> >  +#define MEDIA_BUS_FMT_VYUY12_2X12             0x201d
> >  +#define MEDIA_BUS_FMT_YUYV12_2X12             0x201e
> >  +#define MEDIA_BUS_FMT_YVYU12_2X12             0x201f
>=20
> The above 6 lines introduce duplicate defines, you can remove them.

OK, thanks, done for tomorrow.  Though hopefully all this will be
resolved soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/0FvtHsZk_4Di.VV/6qA+eTA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNgQoAAoJEMDTa8Ir7ZwV2W4P/0poe95LNk6hdQN4oNvXvItT
SK3s03cgih4VeqaGQ6CzsjNHLc382lbmh8dWX6h1/DhIV9ZebrDzoZT98TBBH3/i
pyPhGMpEhFJOydq0vrxH56K9XHpIhNCEiDdzXwcyTkp6uHLqd0raJ7yDkojKlU0a
l6O6D7CbDIiKuzzdiTr2RFrGAEYwg7DmYzcgalK01KQG/tWnxmwtNqs8j/DOJS2q
/JtAAeUr0iVan99IxZJnCQYqUr0Y9Cql2vUGoeoZu5G0nzhS/u1eJcpGPCJEH15/
2hjOXvxfsenmx8LOqTylqBHu4T/CcnS0jxGUssxzDRsQ8Nw9Xr6u6MLIqBG+z4Mm
5JsLOT5wvCs1nmOa9j6IdAXOt++WSZdTxEHawMR477lZcU27u2WZWEQbSHGR7xsm
ki3wbLAUa1UbzqsWMgkT4DgRNdc9fv34B/UmXYPTAhefvwMwZ9IYSvIULVWRqLjs
8cBhKRQ1JFqLEYi5xAoYRso0BFXW08bXJRazUmkU5VOtpJoZfRbju8255uwsC1Eh
2t/Y/IZQjRc6ZVQZ9fBFZjBPs9/k7mRPXv22Enp3XXpcYse2HvvwYHF0hdsKbsbs
0gup+3HRA45X3ku1TkhoclwkCfOiKLnV+htnrwRgk8DdP5TB95/uV5bYFTDBJPsF
3ELkidlZvMZCWKV3VbG/
=u8oC
-----END PGP SIGNATURE-----

--Sig_/0FvtHsZk_4Di.VV/6qA+eTA--
