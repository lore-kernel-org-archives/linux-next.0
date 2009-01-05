From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Pull request for Squashfs
Date: Tue, 6 Jan 2009 00:37:43 +1100
Message-ID: <20090106003743.41b7a246.sfr@canb.auug.org.au>
References: <E1Kv0C3-0006GU-ES@dylan>
	<20081028192919.94def38b.akpm@linux-foundation.org>
	<4961FD0C.8040309@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Jan_2009_00_37_43_+1100_NjeRiGf2TE+mfgld"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34109 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751732AbZAENhw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 08:37:52 -0500
In-Reply-To: <4961FD0C.8040309@lougher.demon.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Tue__6_Jan_2009_00_37_43_+1100_NjeRiGf2TE+mfgld
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

On Mon, 05 Jan 2009 12:29:00 +0000 Phillip Lougher <phillip@lougher.demon.c=
o.uk> wrote:
>
> Can you try pulling the master branch of:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git

I fetched this to have a look and it is based on next-20090105.  You
cannot base any git tree that is to be included into linux-next on
linux-next itself.  You should base it on Linus' latest tree (except for
very special cases where your code actually depends on something that is
only in thelinux-next tree).  Once it is set up like that, you don't need
to keep rebasing it and only need to merge Linus' tree into it if there
are more than trivial conflicts (which there shouldn't be given it
touches very little outside fs/squashfs).

I also expected it to be a series of commits to match (more or less) what
you have been posting for review.

I fetched your squashfs-linus.git instead and that looks exactly like
what I need.

I also just noticed Andrew's comment about aiming for a 2.6.29 merge (I
should read my mail better), so I will add your squashfs-linus.git tree
to linux-next tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Jan_2009_00_37_43_+1100_NjeRiGf2TE+mfgld
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkliDScACgkQjjKRsyhoI8wKDQCfU63xJWb1DsP3H/7cUiYyIRgy
jvEAoL37wT+h5eDEi5jyAfHa4XaSCbG6
=ycuz
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Jan_2009_00_37_43_+1100_NjeRiGf2TE+mfgld--
