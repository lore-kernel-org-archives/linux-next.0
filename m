From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mmc tree build failure
Date: Thu, 4 Dec 2008 15:28:29 +1100
Message-ID: <20081204152829.69a795a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_15_28_29_+1100_PkMAwSLatyjVBu5D"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49515 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751027AbYLDE2l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 23:28:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>, Philip Langdale <philipl@overt.org>

--Signature=_Thu__4_Dec_2008_15_28_29_+1100_PkMAwSLatyjVBu5D
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mmc/host/ricoh_mmc.c:235: error: variable 'ricoh_mmc_pm_ext_opts' h=
as initializer but incomplete type
drivers/mmc/host/ricoh_mmc.c:236: error: unknown field 'suspend_noirq' spec=
ified in initializer
drivers/mmc/host/ricoh_mmc.c:236: warning: excess elements in struct initia=
lizer
drivers/mmc/host/ricoh_mmc.c:236: warning: (near initialization for 'ricoh_=
mmc_pm_ext_opts')
drivers/mmc/host/ricoh_mmc.c:237: error: unknown field 'resume_noirq' speci=
fied in initializer
drivers/mmc/host/ricoh_mmc.c:237: warning: excess elements in struct initia=
lizer
drivers/mmc/host/ricoh_mmc.c:237: warning: (near initialization for 'ricoh_=
mmc_pm_ext_opts')
drivers/mmc/host/ricoh_mmc.c:245: error: unknown field 'pm' specified in in=
itializer
drivers/mmc/host/ricoh_mmc.c:245: warning: initialization from incompatible=
 pointer type

Due to commit 75766a3cee0a1eb2f373e8112a73e69262e7831a ("ricoh_mmc: Use
suspend/resume_noirq") clashing with commit
6e674b2ed59695a90166d9500aa2696a495696e7 ("PM: Simplify the new
suspend/hibernation framework for devices") from the driver-core tree.

I am not sure what to do with this, so I have reverted the mmc tree
commit above for today.  Hopefully, Rafael can suggest a fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_15_28_29_+1100_PkMAwSLatyjVBu5D
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3XG0ACgkQjjKRsyhoI8y3hwCdF/VIE//T/iSx77EJH2OZRDb0
hDwAn2X7sJtTb49elcENFULAXZ0+rF+g
=FEQ2
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_15_28_29_+1100_PkMAwSLatyjVBu5D--
