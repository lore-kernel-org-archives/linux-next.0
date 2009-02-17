From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build error
Date: Tue, 17 Feb 2009 23:27:59 +1100
Message-ID: <20090217232759.0558654f.sfr@canb.auug.org.au>
References: <20090217161252.ef44979c.sfr@canb.auug.org.au>
	<200902172234.14660.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Feb_2009_23_27_59_+1100_dEYw/li/e0ViQRX0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55243 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751340AbZBQM2G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 07:28:06 -0500
In-Reply-To: <200902172234.14660.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Anders Kaseorg <andersk@mit.edu>, Jeff Arnold <jbarnold@mit.edu>, Tim Abbott <tabbott@mit.edu>

--Signature=_Tue__17_Feb_2009_23_27_59_+1100_dEYw/li/e0ViQRX0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Tue, 17 Feb 2009 22:34:14 +1030 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> Thanks, this does not happen on x86, I guess some weird include tangle.
>=20
> Fix is simple (declare struct module), I've done it now.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Feb_2009_23_27_59_+1100_dEYw/li/e0ViQRX0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmarU8ACgkQjjKRsyhoI8z3kACgnWJXemZLDcwcWmp5CmEYCnSe
1vIAnRyQQiUtVFCt2DFnJwgktwP6ZUyH
=O2Wl
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Feb_2009_23_27_59_+1100_dEYw/li/e0ViQRX0--
