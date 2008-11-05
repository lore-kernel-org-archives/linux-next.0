From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 5 Nov 2008 12:57:32 +1100
Message-ID: <20081105125732.75e7680c.sfr@canb.auug.org.au>
References: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
	<20081103125229.2c9fa255.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_12_57_32_+1100_F2d/S9ZEW7JrC=gS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60755 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754092AbYKEB5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 20:57:43 -0500
In-Reply-To: <20081103125229.2c9fa255.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Andreas Oberritter <obi@linuxtv.org>

--Signature=_Wed__5_Nov_2008_12_57_32_+1100_F2d/S9ZEW7JrC=gS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Mauro,

On Mon, 3 Nov 2008 12:52:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 29 Oct 2008 13:20:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > drivers/media/dvb/dvb-core/dvbdev.c: In function 'dvb_register_device':
> > drivers/media/dvb/dvb-core/dvbdev.c:254: error: implicit declaration of=
 function 'nums2minor'
> >=20
> > Caused by commit f3d9182030d9655d9ffff33dfceb45b4a127b6ec ("V4L/DVB
> > (9361): Dynamic DVB minor allocation") which clearly has not even been
> > built with CONFIG_DVB_DYNAMIC_MINORS=3Dy.
>=20
> This is still happening today, so I have excluded the v4l-dvb tree for
> today.  Please get this fixed up.

And again ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_12_57_32_+1100_F2d/S9ZEW7JrC=gS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkQ/YwACgkQjjKRsyhoI8wavQCcDe6GoZb9ZygkuLkFsWXAsgnP
6NIAn25k+j5xV88H6+4t2lHtTRAqvzTh
=73jd
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_12_57_32_+1100_F2d/S9ZEW7JrC=gS--
