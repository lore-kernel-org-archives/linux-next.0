From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Thu, 17 Jul 2008 14:05:18 +1000
Message-ID: <20080717140518.0d3ad6df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_14_05_18_+1000_RFW_2kULOquBd/UB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55452 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750784AbYGQEF2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 00:05:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__17_Jul_2008_14_05_18_+1000_RFW_2kULOquBd/UB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/process.c between commit
aa276e1cafb3ce9d01d1e837bcd67e92616013ac ("x86, clockevents: add C1E
aware idle function") from linus' tree and commit
dbce8340e4549b612ac74fc7175721f9aed67b62 ("ACPI: Create "idle=3Dhalt"
bootparam") from the acpi tree (which is also in Linus' tree).

Just overlapping additions.  A merge of Linus' tree will make it go away.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_14_05_18_+1000_RFW_2kULOquBd/UB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+xP4ACgkQjjKRsyhoI8xODQCgqcx/s33KijKUrQnKtZchlNuR
ku0AnA0CGABCUKWtIoRzLpckcaZF74mm
=MC6k
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_14_05_18_+1000_RFW_2kULOquBd/UB--
