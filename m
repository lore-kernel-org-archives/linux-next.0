From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for January 18 (__modver_version_show)
Date: Wed, 19 Jan 2011 16:09:51 +1100
Message-ID: <20110119160951.2a14d0a0.sfr@canb.auug.org.au>
References: <20110118122139.6c2a6f2f.sfr@canb.auug.org.au>
	<20110118091749.ac5823df.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Jan_2011_16_09_51_+1100_Quqw1Uz9UoGNtGS0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59387 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750712Ab1ASFJ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Jan 2011 00:09:57 -0500
In-Reply-To: <20110118091749.ac5823df.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__19_Jan_2011_16_09_51_+1100_Quqw1Uz9UoGNtGS0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 18 Jan 2011 09:17:49 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> I'm seeing this on several builds (i386 and x86_64):
>=20
> lib/built-in.o:(__modver+0x8): undefined reference to `__modver_version_s=
how'
> lib/built-in.o:(__modver+0x2c): undefined reference to `__modver_version_=
show'
>=20
> It looks like the compiler or linker is dropping that function from the
> build since it cannot see any references to it...
> At least __modver_version_show is not in the kernel/params.o file.

Do these builds have CONFIG_SYSFS set?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Jan_2011_16_09_51_+1100_Quqw1Uz9UoGNtGS0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNNnIfAAoJEDMEi1NhKgbscfwH+wVVDnvmi6zPZYGJPR90oDm8
yRDZFikgUrN3/OA5slDl4XLooz+pSrKCVsbytc2eFKBPrWCWCzldOFJTlnihiF0r
T1JdC4vRZgaoQxjlJaKl9JkSW+AKNgDX48SLSHJJ9803Sitisy9byqK8LeFLTEfC
meRrJq2pItZXqayL33wA+PnHVnOlDDLyeWSKfZPgASya1XV0cxC+kgjA4+tmWhiG
k2USwjF03Leef72kVLPp25jrcO4bYojS2OUoWYTNZ2B0I2NAb5BXwqy1jWE1AWPd
Kpl8Px5fbvmVpeCajEnYCljnTehrC6/cO3+PeqnDULeSxrjupmralYm4V20Ye54=
=AiqY
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Jan_2011_16_09_51_+1100_Quqw1Uz9UoGNtGS0--
