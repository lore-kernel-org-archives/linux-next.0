From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Merge request for kmemleak patches
Date: Tue, 28 Jul 2009 21:00:22 +1000
Message-ID: <20090728210022.f5226f20.sfr@canb.auug.org.au>
References: <1248772559.17665.12.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Jul_2009_21_00_22_+1000_SFTL4AUnmDB9O1Id"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58776 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751441AbZG1LA3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2009 07:00:29 -0400
In-Reply-To: <1248772559.17665.12.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Tue__28_Jul_2009_21_00_22_+1000_SFTL4AUnmDB9O1Id
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Tue, 28 Jul 2009 10:15:59 +0100 Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>
> There are a few more kmemleak patches for the upcoming merging window
> (the first one will be pushed before). Could you please pull them into
> the -next tree? Thanks.
>=20
>   git://linux-arm.org/linux-2.6.git kmemleak

I have added the tree back for tomorrow.

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Jul_2009_21_00_22_+1000_SFTL4AUnmDB9O1Id
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpu2kYACgkQjjKRsyhoI8wP9gCfTk6YBbJ1fAqIKC1SYsofWz9B
8JwAn1QkBREWooIS6NaS86lteIgAt76N
=QGS0
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Jul_2009_21_00_22_+1000_SFTL4AUnmDB9O1Id--
