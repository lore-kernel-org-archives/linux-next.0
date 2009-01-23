From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 21:39:27 +1100
Message-ID: <20090123213927.61beb5b3.sfr@canb.auug.org.au>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
	<20090122.235612.256786187.davem@davemloft.net>
	<20090123190103.1420c62f.sfr@canb.auug.org.au>
	<20090123.001337.179440063.davem@davemloft.net>
	<20090123212128.16cd5698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_21_39_27_+1100_hwx7IN=SB8PkApIt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54257 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755185AbZAWKjd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 05:39:33 -0500
In-Reply-To: <20090123212128.16cd5698.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Fri__23_Jan_2009_21_39_27_+1100_hwx7IN=SB8PkApIt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Fri, 23 Jan 2009 21:21:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> So, this could be a compiler bug?

We pass -fno-common to gcc which seems to cause the (non-extern) const
variable to end up in the bss.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_21_39_27_+1100_hwx7IN=SB8PkApIt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl5nl8ACgkQjjKRsyhoI8zu4gCeJEmrxhCabj3m0kpYO/lSWZQo
1zQAn3iFzKeiPLdde694Kyv+2gPWig6P
=590L
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_21_39_27_+1100_hwx7IN=SB8PkApIt--
