From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build warnings
Date: Thu, 30 Apr 2009 17:06:13 +1000
Message-ID: <20090430170613.cd339558.sfr@canb.auug.org.au>
References: <20090429145921.5bb48c01.sfr@canb.auug.org.au>
	<20090428.230232.113827653.davem@davemloft.net>
	<20090429.175413.81058049.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Apr_2009_17_06_13_+1000_Hx7uUTBkHI+iz3RE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39666 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751112AbZD3HGS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 03:06:18 -0400
In-Reply-To: <20090429.175413.81058049.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, a.beregalov@gmail.com

--Signature=_Thu__30_Apr_2009_17_06_13_+1000_Hx7uUTBkHI+iz3RE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 29 Apr 2009 17:54:13 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> From: David Miller <davem@davemloft.net>
> Date: Tue, 28 Apr 2009 23:02:32 -0700 (PDT)
>=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 29 Apr 2009 14:59:21 +1000
> >=20
> >> Caused by commit 011983048a120e520147361be1067dd82343038e ("vxge: use =
max()
> >> instead of VXGE_HW_SET_LEVEL").
> >=20
> > Maybe that's why the macro was used in the first place :-)
> >=20
> > We probably have to use something like max_t() here, and to me that's
> > worse than the macro it is replacing.
>=20
> Nobody is doing anything about this so I'm simply reverting.

OK, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Apr_2009_17_06_13_+1000_Hx7uUTBkHI+iz3RE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn5TeUACgkQjjKRsyhoI8yZWwCcDXojjXb3gAvYZZ4PZZegGJ8W
cHEAnAr/FGAOOU+iazQ48w+9ESFpQTfu
=33Mt
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Apr_2009_17_06_13_+1000_Hx7uUTBkHI+iz3RE--
