From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 19:01:03 +1100
Message-ID: <20090123190103.1420c62f.sfr@canb.auug.org.au>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
	<20090122.235612.256786187.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_19_01_03_+1100_M.5r5pSr.Mce1gh9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39326 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753883AbZAWIBI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 03:01:08 -0500
In-Reply-To: <20090122.235612.256786187.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Fri__23_Jan_2009_19_01_03_+1100_M.5r5pSr.Mce1gh9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 22 Jan 2009 23:56:12 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Does this patch fix it? I can't see any other way to end up
> with a multiple definition like that.

It confused me as well (one of the defintions is in the bss and one in
ro-data).  I will give your patch a try later tonight.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_19_01_03_+1100_M.5r5pSr.Mce1gh9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl5eT8ACgkQjjKRsyhoI8weSQCfeEOKIg2AZUlxeAu95ebt+9w2
0hoAn3lnFNzkZvLDkYzIqTWVVo+FmsfW
=eqyO
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_19_01_03_+1100_M.5r5pSr.Mce1gh9--
