From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: spinlock lockup with next-20081118 on powerpc
Date: Wed, 19 Nov 2008 10:44:33 +1100
Message-ID: <20081119104433.45a10893.sfr@canb.auug.org.au>
References: <20081119093023.48895b84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_10_44_33_+1100_D6tX2_ZyKCmh+QSc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57802 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752165AbYKRXow (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 18:44:52 -0500
In-Reply-To: <20081119093023.48895b84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ppc-dev <linuxppc-dev@ozlabs.org>
Cc: linux-next@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

--Signature=_Wed__19_Nov_2008_10_44_33_+1100_D6tX2_ZyKCmh+QSc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Nov 2008 09:30:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> This was on a Power5 partition.  I am attempting to reproduce the problem.

OK, it reproduces.  The machine is a Power5 partition (IBM,9124-720
eServer OpenPower 720) with 1 (2 way threaded) cpu (gr, rev2.1, 1.5GHz),
2G of memory, 2 NUMA nodes running Ubuntu Gutsy.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_10_44_33_+1100_D6tX2_ZyKCmh+QSc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjU2EACgkQjjKRsyhoI8zqnQCfa7fAlriAKHD51Xx8JBDowpDS
LT4AoIzul9lqKucHjsG7E7QgAoOxlFOg
=49AU
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_10_44_33_+1100_D6tX2_ZyKCmh+QSc--
