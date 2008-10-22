From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 18:21:49 +1100
Message-ID: <20081022182149.f89fe88d.sfr@canb.auug.org.au>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au>
	<20081022043227.GA31413@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Oct_2008_18_21_49_+1100_=1XwtZFuJhfJZ84q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49627 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751948AbYJVHW1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 03:22:27 -0400
In-Reply-To: <20081022043227.GA31413@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Wed__22_Oct_2008_18_21_49_+1100_=1XwtZFuJhfJZ84q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 22 Oct 2008 06:32:27 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> This seems to have been caused by a git-rerere bug - it mis-matched a=20
> timers tree conflict resolution. I cleared out that resolution (it had=20
> nothing to do with stackprotector), re-did the conflict resolution=20
> (which was about overlapping additions of header files), and pushed out=20
> a new stackprotector tree - the delta below has the expected result.

I wondered how you could have possibly got that result - aren't computers
wonderful! :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Oct_2008_18_21_49_+1100_=1XwtZFuJhfJZ84q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj+1I0ACgkQjjKRsyhoI8zLrQCeKfrU2RE5UaexeaP4bL7kAT8z
6QkAnR8vo9DAlyN49YUxVEOaZXF6EIAD
=8JT7
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Oct_2008_18_21_49_+1100_=1XwtZFuJhfJZ84q--
