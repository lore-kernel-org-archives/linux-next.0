From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 12 Jan 2010 13:39:00 +1100
Message-ID: <20100112133900.f22b3b72.sfr@canb.auug.org.au>
References: <20100112121434.49930eea.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.1001111720290.17145@localhost.localdomain>
	<20100112133252.8b4591bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Jan_2010_13_39_00_+1100_Ak6an=j0EUIuF11q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55726 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751112Ab0ALCjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 21:39:08 -0500
In-Reply-To: <20100112133252.8b4591bd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Phillip Lougher <phillip@lougher.demon.co.uk>

--Signature=_Tue__12_Jan_2010_13_39_00_+1100_Ak6an=j0EUIuF11q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Jan 2010 13:32:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I guess there is something else in the partially
> created linux-next today that has triggered this build failure.   I will
> investigate further.

Yes, there are two commits in the squashfs tree that rearrange some of
the decompression code.  They are:

"lzma: Make lzma available to non initramfs/initrd code"
"lzma: make lzma reentrant"

Phillip, you need to merge Linus' tree (or rebase on it) and fix those up
for the introduction of the LZO decompression stuff.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Jan_2010_13_39_00_+1100_Ak6an=j0EUIuF11q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktL4MQACgkQjjKRsyhoI8x+agCeNJ0bIpbksbuQG+qYqi6OaUAv
SO0An34WPgRxiSGNSSZtloQJC6vMEmtV
=TSzZ
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Jan_2010_13_39_00_+1100_Ak6an=j0EUIuF11q--
