From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Next March 26: s390 allnoconfig build failure still exists
Date: Fri, 27 Mar 2009 08:57:48 +1100
Message-ID: <20090327085748.5422e4bc.sfr@canb.auug.org.au>
References: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
	<49CB5165.4060401@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Mar_2009_08_57_48_+1100_f9OTUaIp8hy3H/Va"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52034 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932396AbZCZV55 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 17:57:57 -0400
In-Reply-To: <49CB5165.4060401@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, heiko.carstens@de.ibm.com

--Signature=_Fri__27_Mar_2009_08_57_48_+1100_f9OTUaIp8hy3H/Va
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Thu, 26 Mar 2009 15:26:53 +0530 Sachin Sant <sachinp@in.ibm.com> wrote:
>
> I still see the following s390 allnoconfig build failure
> with today's next (and previous trees as well ).
>=20
> arch/s390/include/asm/smp.h:96: error: redefinition of smp_send_stop
> include/linux/smp.h:125: error: previous definition of smp_send_stop was =
here

There will be a fix for this in today's linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Mar_2009_08_57_48_+1100_f9OTUaIp8hy3H/Va
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknL+lwACgkQjjKRsyhoI8xUZgCfYUfOZTaSzNOQsBc+qa+eDq3m
BnkAn0KT2rfYJQLujCApks7DluEfGH0p
=sFtS
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Mar_2009_08_57_48_+1100_f9OTUaIp8hy3H/Va--
