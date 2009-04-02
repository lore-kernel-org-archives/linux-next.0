From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Thu, 2 Apr 2009 16:49:27 +1100
Message-ID: <20090402164927.97958f84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__2_Apr_2009_16_49_27_+1100_ON5j9VVWk.ma4cPa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43997 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754093AbZDBFti (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 01:49:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Vasu Dev <vasu.dev@intel.com>, Robert Love <robert.w.love@intel.com>

--Signature=_Thu__2_Apr_2009_16_49_27_+1100_ON5j9VVWk.ma4cPa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/scsi/fcoe/fcoe.c:982: error: __ksymtab_fcoe_fc_crc causes a section=
 type conflict
drivers/scsi/fcoe/fcoe.c:982: error: __ksymtab_fcoe_fc_crc causes a section=
 type conflict

Reverting commit 0c3cb56ec3321b23e9826cccf822470717be6e08 ("[SCSI] fcoe:
cleans up libfcoe.h and adds fcoe.h for fcoe module") makes the error go
away.  I have no idea why - the only clue is that the only global
declaration of fcoe_fc_crc() is removed by that commit.

Using a different compiler version (4.1.2) also fixed the problem.

I also had to revert commits 60390544fcc212e0657cf1eea639691d09651943
("[SCSI] fcoe, libfc: fix double fcoe_softc memory alloc") and
ba070644bff4390c965e99b1997f2cbec4157b46 ("[SCSI] fcoe, libfcoe: Add
support for FIP. FCoE discovery and keep-alive") since they followed the
one above.

I wonder if that function even needs to be exported as it is only used
withing the one file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__2_Apr_2009_16_49_27_+1100_ON5j9VVWk.ma4cPa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAknUUecACgkQjjKRsyhoI8yQQgCfR5hDTed5gSDBkBlJwj3inZkF
BTYAmJbZkDparRDWzD9sZzEDqLFFoZA=
=6IF6
-----END PGP SIGNATURE-----

--Signature=_Thu__2_Apr_2009_16_49_27_+1100_ON5j9VVWk.ma4cPa--
