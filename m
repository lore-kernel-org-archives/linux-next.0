From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm build failure
Date: Mon, 23 Jun 2008 18:11:50 +1000
Message-ID: <20080623181150.b8da106a.sfr@canb.auug.org.au>
References: <20080616160747.27909f11.sfr@canb.auug.org.au>
	<20080616072915.GA17191@flint.arm.linux.org.uk>
	<20080616173757.4d8ba97a.sfr@canb.auug.org.au>
	<20080622190041.GB21340@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_18_11_50_+1000_x2OdWfOE2ceBh8a2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43966 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752451AbYFWIL6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 04:11:58 -0400
In-Reply-To: <20080622190041.GB21340@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Mon__23_Jun_2008_18_11_50_+1000_x2OdWfOE2ceBh8a2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sun, 22 Jun 2008 20:00:41 +0100 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> Okay, this should now be fixed.  Please confirm when you run your next
> linux-next build.

This no longer breaks the x86_64 allmodconfig build.  The arm builds will
be done later tonight.

Thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Jun_2008_18_11_50_+1000_x2OdWfOE2ceBh8a2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfWsYACgkQTgG2atn1QN8ydQCgiuzEHqnsbLeFB8CKedYDXOO6
O3sAn1xp5Z4egC7Lj4aUJerC70cNGB4w
=WpUB
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_18_11_50_+1000_x2OdWfOE2ceBh8a2--
