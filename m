From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUG] linux-next: Tree for August 26 - Badness at
 kernel/notifier.c:25
Date: Thu, 28 Aug 2008 00:33:08 +1000
Message-ID: <20080828003308.400038e0.sfr@canb.auug.org.au>
References: <20080826184008.6be39f19.sfr@canb.auug.org.au>
	<48B44B2D.8070809@linux.vnet.ibm.com>
	<48B46610.1010809@linux.intel.com>
	<48B53695.3020703@linux.vnet.ibm.com>
	<48B55B16.7060804@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_00_33_08_+1000_YX5+22H_Giwkidmk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52621 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754004AbYH0OdT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 10:33:19 -0400
In-Reply-To: <48B55B16.7060804@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, mingo@elte.hu, Andy Whitcroft <apw@shadowen.org>

--Signature=_Thu__28_Aug_2008_00_33_08_+1000_YX5+22H_Giwkidmk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arjan,

On Wed, 27 Aug 2008 06:48:06 -0700 Arjan van de Ven <arjan@linux.intel.com>=
 wrote:
>
> Kamalesh Babulal wrote:
> >=20
> > Thanks for reference of the patch, After replacing the patch with the l=
atest=20
> > one above on the powerpc, the warning still remains
> >=20
> > Badness at kernel/notifier.c:86
>=20
> sadly you have something going on that doesn't list the modules loaded et=
c...
>=20
> is this during boot or way later?
> (because if it's the later, you might be hitting a legitimate bug ;-)

The original reported trace was during setup_system which is very early in
the boot.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_00_33_08_+1000_YX5+22H_Giwkidmk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki1ZaQACgkQjjKRsyhoI8z5vwCgl4ClHwY0QMDLBsBxl3/sIoe7
m9IAnA/GYD5p9M+lO0PUllTxajVvzhOC
=UinA
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_00_33_08_+1000_YX5+22H_Giwkidmk--
