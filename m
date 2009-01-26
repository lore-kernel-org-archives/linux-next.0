From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 26 Jan 2009 19:31:26 +1100
Message-ID: <20090126193126.9f4bb227.sfr@canb.auug.org.au>
References: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
	<20090125.204623.137022547.davem@davemloft.net>
	<20090126161523.3be36393.sfr@canb.auug.org.au>
	<20090125.211755.242252297.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jan_2009_19_31_26_+1100_T5=6hCL9dK1UEq=K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38943 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750861AbZAZIbd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jan 2009 03:31:33 -0500
In-Reply-To: <20090125.211755.242252297.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Mon__26_Jan_2009_19_31_26_+1100_T5=6hCL9dK1UEq=K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 25 Jan 2009 21:17:55 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Ahh, I see.  Can you possibly give this a try before I
> push it out?

My x86_64 allmodconfig now builds (with the two net commits restored and
your patch applied).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jan_2009_19_31_26_+1100_T5=6hCL9dK1UEq=K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl9dN4ACgkQjjKRsyhoI8ziKACfVJNSb/sPVWY0qD6avFqwY7mb
3CcAnRdTzsOY/DFw/rzKeXo4OmBQV1r/
=TRqU
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jan_2009_19_31_26_+1100_T5=6hCL9dK1UEq=K--
