From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Mon, 3 Nov 2008 12:52:29 +1100
Message-ID: <20081103125229.2c9fa255.sfr@canb.auug.org.au>
References: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__3_Nov_2008_12_52_29_+1100_E=gvMDnD1tkA0c/o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47167 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754039AbYKCBwj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 20:52:39 -0500
In-Reply-To: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Andreas Oberritter <obi@linuxtv.org>

--Signature=_Mon__3_Nov_2008_12_52_29_+1100_E=gvMDnD1tkA0c/o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Wed, 29 Oct 2008 13:20:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> drivers/media/dvb/dvb-core/dvbdev.c: In function 'dvb_register_device':
> drivers/media/dvb/dvb-core/dvbdev.c:254: error: implicit declaration of f=
unction 'nums2minor'
>=20
> Caused by commit f3d9182030d9655d9ffff33dfceb45b4a127b6ec ("V4L/DVB
> (9361): Dynamic DVB minor allocation") which clearly has not even been
> built with CONFIG_DVB_DYNAMIC_MINORS=3Dy.

This is still happening today, so I have excluded the v4l-dvb tree for
today.  Please get this fixed up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__3_Nov_2008_12_52_29_+1100_E=gvMDnD1tkA0c/o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkOWV0ACgkQjjKRsyhoI8zH7gCfQXRu/1DJCBwJA+9OIaA1OdPE
NdkAoJPDfuwsCy1xB+L9Je3S+yow9fsZ
=mIYD
-----END PGP SIGNATURE-----

--Signature=_Mon__3_Nov_2008_12_52_29_+1100_E=gvMDnD1tkA0c/o--
