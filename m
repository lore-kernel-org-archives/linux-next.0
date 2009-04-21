From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cris build failure
Date: Tue, 21 Apr 2009 16:22:12 +1000
Message-ID: <20090421162212.89505c32.sfr@canb.auug.org.au>
References: <20090421135843.0993cb89.sfr@canb.auug.org.au>
	<20090421060623.GP21811@axis.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Apr_2009_16_22_12_+1000_Wf5oqY2_a=_n/WTy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36949 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750919AbZDUGWS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 02:22:18 -0400
In-Reply-To: <20090421060623.GP21811@axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Nilsson <Jesper.Nilsson@axis.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

--Signature=_Tue__21_Apr_2009_16_22_12_+1000_Wf5oqY2_a=_n/WTy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

On Tue, 21 Apr 2009 08:06:23 +0200 Jesper Nilsson <Jesper.Nilsson@axis.com>=
 wrote:
>
> Yes, you are quite correct. I have been working (albeit slowly)
> at removing all non-standard commands and port specific symlinks,
> and I have a patch that folds the boot code for both v32 and v10
> into the same directory. That patch also removes the gcc-cris usage.
>=20
> I'll push that out to my for-next branch asap.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Apr_2009_16_22_12_+1000_Wf5oqY2_a=_n/WTy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkntZhQACgkQjjKRsyhoI8zfXwCgoGE/yyHi1G10xXnvtO3ZGFrC
PRwAoJB6mbfFp/jW82QhaxYGIMmflU+9
=WY90
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Apr_2009_16_22_12_+1000_Wf5oqY2_a=_n/WTy--
