From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Tue, 3 Mar 2009 12:55:25 +1100
Message-ID: <20090303125525.1cb0baf9.sfr@canb.auug.org.au>
References: <20090302180514.9b07c7d9.sfr@canb.auug.org.au>
	<20090302.014958.31955182.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Mar_2009_12_55_25_+1100_zGTl1/UrTcvqUw23"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40852 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750904AbZCCBzf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 20:55:35 -0500
In-Reply-To: <20090302.014958.31955182.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, andy.grover@oracle.com

--Signature=_Tue__3_Mar_2009_12_55_25_+1100_zGTl1/UrTcvqUw23
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 02 Mar 2009 01:49:58 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Mar 2009 18:05:14 +1100
>=20
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> >=20
> > net/rds/cong.c: In function 'rds_cong_set_bit':
> > net/rds/cong.c:284: error: implicit declaration of function 'generic___=
set_le_bit'
> > net/rds/cong.c: In function 'rds_cong_clear_bit':
> > net/rds/cong.c:298: error: implicit declaration of function 'generic___=
clear_le_bit'
> > net/rds/cong.c: In function 'rds_cong_test_bit':
> > net/rds/cong.c:309: error: implicit declaration of function 'generic_te=
st_le_bit'
>=20
> I've fixed this up as follows:

I was actually wondering if this was some API that powerpc had not
implemented (most other architectures include asm-generic/bitops/le.h in
their asm/bitops.h via asm-generic/bitops/ext2-non-atomic.h or
asm-generic/bitops/minix-le.h) or whether RDS should be using some other
API (since this is the first use of those functions outside the headers
above).

--=20
Cheers,
Stephen Rothwell

--Signature=_Tue__3_Mar_2009_12_55_25_+1100_zGTl1/UrTcvqUw23
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmsjg0ACgkQjjKRsyhoI8yE8ACgmfffHhASNVYN9TM/hR1PEDho
FXMAoKy/x6fflAJbiMWYFi5dIWM/L+qm
=+B4y
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Mar_2009_12_55_25_+1100_zGTl1/UrTcvqUw23--
