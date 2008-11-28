From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: drivers/x86 (Was: Re: linux-next: Tree for November 28
 (misc/tc1100))
Date: Sat, 29 Nov 2008 08:35:50 +1100
Message-ID: <20081129083550.3c23af37.sfr@canb.auug.org.au>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
	<4930307C.30106@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__29_Nov_2008_08_35_50_+1100_zu18iXK=7RyZcY/R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752720AbYK1VgI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 16:36:08 -0500
In-Reply-To: <4930307C.30106@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <len.brown@intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>, x86@kernel.org

--Signature=_Sat__29_Nov_2008_08_35_50_+1100_zu18iXK=7RyZcY/R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Fri, 28 Nov 2008 09:55:08 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> make[2]: *** No rule to make target `drivers/misc/tc1100-wmi.o', needed b=
y `drivers/misc/built-in.o'.
>=20
> on allmodconfig & allyesconfig for i386.
>=20
> On, moved to drivers/x86/.  Someone needs to clean up drivers/misc/Makefi=
le.

Just wondering where the move to drivers/x86 was discussed, (reviewed and
tested) and why the change is in the acpi tree and not the x86 tree?

I am not saying it should not be done (I haven't looked enough to have an
opinion).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__29_Nov_2008_08_35_50_+1100_zu18iXK=7RyZcY/R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkwZDYACgkQjjKRsyhoI8zPNwCfWKpai2l5ACY6syZ66QEf87Jf
MVMAn1dM4hL079n9FFk/21Dt97nKPAI0
=sBRS
-----END PGP SIGNATURE-----

--Signature=_Sat__29_Nov_2008_08_35_50_+1100_zu18iXK=7RyZcY/R--
