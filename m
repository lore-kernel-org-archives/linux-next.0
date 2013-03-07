From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Multiple for-next branches from same tree
Date: Thu, 7 Mar 2013 22:24:46 +1100
Message-ID: <20130307222446.d2b14a7a3785ef99dbf098b8@canb.auug.org.au>
References: <51382DCA.5010209@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__7_Mar_2013_22_24_46_+1100_cO.6QTp=ZGKXx3nf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:54491 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932278Ab3CGLY6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Mar 2013 06:24:58 -0500
In-Reply-To: <51382DCA.5010209@synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Thu__7_Mar_2013_22_24_46_+1100_cO.6QTp=ZGKXx3nf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

On Thu, 7 Mar 2013 11:33:54 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com>=
 wrote:
>
> With ARC arch merged in 3.9-rc1 I feel the need for a revised workflow.
>=20
> I intend to have 2 branches for -next exposure: for-curr and for-next.
> * for-curr would contain the bug fixes for this release to be sent to Lin=
us at
> some point in time.
> * for-next obviously is next release stuff and will be rebased off for-cu=
rr.

I have several sets of branches like that and it works fine.

Occasionally, the branches will conflict, but that can be sorted by
merging the for-curr branch into the for-next branch after Linus has
merged the for-curr branch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__7_Mar_2013_22_24_46_+1100_cO.6QTp=ZGKXx3nf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJROHj+AAoJEECxmPOUX5FEtioQAIuMFDqTihi8OcbGkbEj3WRU
fEKFlr/nsnIIk7+yeiNh6yIOLt0UickwRSi++kHDrzngh3o4S6E8lq7zhRjyacTO
xBnBS3qA0qAAFd095I7HT5xr0jKD0ApWNEU+JqMjtgpnJNTo7h5Q4yKxVP+HdbdC
BRrJvqFuc3SM9uS+KWEH27LjGdy56hpsNOVV46KiXl9XITzxM7lQoPcHPwKGZ9E5
MpQDuJ2jQlW6/MKwDspjVKOAgXcakR6MY8nhxNEjLmNO6DrLGHl7YqRB8QtVBNg5
xypMT6RMse850mN8TUH69gU4tL4s26L5Epm3xXCrhDRWVLdLTbPih3jZloLDxWGR
4qUdU4KsZBaUAR6U37z/vZ377BJuMc1MyPWEoAArDeBAjCRtTvFH1qnzMZEOUWby
QzWzIA8VTxXneI1IhSmmJuX5Qz/s8mvDw2f1pUO490X5jZLDwALxNoFrliilx7tz
HHOPSG5HeUsxec55kG1FaohRfnERhzHXfJfGbGgm29ks0QCld3h55WgnCG3jCZ1/
YusK1FJRDaN/POpMkSlStujgRAn0VHrPyrDfsXyDwjcyyzRFIxyrt5bskoiMOt6W
++7Yrp0W+gWfpn/ses9SANl2PHFlcxu6zzYbF2RvfW6JOHNBEGqlKAC3xo58AlmX
5bNbjulFjnM8JZaGczIk
=2jE7
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Mar_2013_22_24_46_+1100_cO.6QTp=ZGKXx3nf--
