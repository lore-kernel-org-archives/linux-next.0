From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the async_tx tree with the arm tree
Date: Tue, 17 Mar 2009 10:12:10 +1100
Message-ID: <20090317101210.9d5a12f1.sfr@canb.auug.org.au>
References: <20090316151054.b518091c.sfr@canb.auug.org.au>
	<1237241887.27945.13.camel@dwillia2-linux.ch.intel.com>
	<20090316222822.GA12334@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_10_12_10_+1100_xJ4JRwWsmiVR9n.0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33731 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755727AbZCPXMS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 19:12:18 -0400
In-Reply-To: <20090316222822.GA12334@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Dan Williams <dan.j.williams@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Guennadi Liakhovetski <lg@denx.de>

--Signature=_Tue__17_Mar_2009_10_12_10_+1100_xJ4JRwWsmiVR9n.0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, 16 Mar 2009 22:28:22 +0000 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> > Russell, if you are merging other changes for this driver it makes sense
> > for the tabs-to-space fix to go in through your tree as well.  If you
> > agree please pull from:
> >=20
> >  git://git.kernel.org/pub/scm/linux/kernel/git/djbw/async_tx.git imx-fb=
-fix
>=20
> Pulled.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_10_12_10_+1100_xJ4JRwWsmiVR9n.0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+3MoACgkQjjKRsyhoI8yzRwCfYBLOSDo9uMzgDYvnHjLKz5na
3V4An3uyjcJv4zhaEF5+wUv5LcCWKEcH
=gnQw
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_10_12_10_+1100_xJ4JRwWsmiVR9n.0--
