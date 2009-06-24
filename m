From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 24 Jun 2009 16:31:44 +1000
Message-ID: <20090624163144.bc59cb97.sfr@canb.auug.org.au>
References: <20090623161416.072b43ba.sfr@canb.auug.org.au>
	<200906241254.24945.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Jun_2009_16_31_44_+1000_+MpSLjQgloM/VqrA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46548 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751301AbZFXGbr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2009 02:31:47 -0400
In-Reply-To: <200906241254.24945.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Wed__24_Jun_2009_16_31_44_+1000_+MpSLjQgloM/VqrA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Wed, 24 Jun 2009 12:54:24 +0930 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> Dumb typo + cut & paste.
>=20
> Fixed,

Thanks, I will pick it up tomorrow.  For today, I have reverted
"cpumask:use-mm_cpumask-arm".

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Jun_2009_16_31_44_+1000_+MpSLjQgloM/VqrA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpByFAACgkQjjKRsyhoI8xMjgCgvzGHE6fdS79VDqEgvsf4hesf
3RcAnj82LPvnYcVJDCgQbqghWKAoASgL
=qTO/
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Jun_2009_16_31_44_+1000_+MpSLjQgloM/VqrA--
