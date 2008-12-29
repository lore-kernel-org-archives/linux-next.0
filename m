From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Mon, 29 Dec 2008 14:55:06 +1100
Message-ID: <20081229145506.115307fe.sfr@canb.auug.org.au>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_14_55_06_+1100_ScyX17iQOpCwCChk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47013 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751449AbYL2DzO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 22:55:14 -0500
In-Reply-To: <20081222113335.667c2d01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

--Signature=_Mon__29_Dec_2008_14_55_06_+1100_ScyX17iQOpCwCChk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 22 Dec 2008 11:33:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such file=
 or directory
>=20
> I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
> Makefile, Kconfig and docbook linkage for the stack") just to make the
> build work.

Still there today.  Inaky sent you a patch, I think.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_14_55_06_+1100_ScyX17iQOpCwCChk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYShoACgkQjjKRsyhoI8zTkwCeIJhPvIpjAY/farYLoKWMEaMO
DgEAnA4kVPTMX+F+DnOTQJnFO4gt4v5W
=gx4r
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_14_55_06_+1100_ScyX17iQOpCwCChk--
