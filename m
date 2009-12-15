From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the voltage tree with Linus' tree
Date: Tue, 15 Dec 2009 13:38:08 +1100
Message-ID: <20091215133808.cd3d4b8b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Dec_2009_13_38_08_+1100_youqA_=FLVqnEm/_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36190 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752030AbZLOCiO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 21:38:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <eduardo.valentin@nokia.com>, Rajendra Nayak <rnayak@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Balaji T K <balajitk@ti.com>

--Signature=_Tue__15_Dec_2009_13_38_08_+1100_youqA_=FLVqnEm/_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

Today's linux-next merge of the voltage tree got a conflict in
drivers/regulator/twl-regulator.c between commit
441a450554dada1c59fc06fdf068cb0eeba53c6d ("regulator: Add support for
twl6030 regulators") from Linus' tree and commits
6360cf42ae51be5f6e6e72d6e81f202d9db0f7e9 ("twl4030-regulator: Remove
regulator from all groups when disabling") and
3277b9fce0fcaa68d5947429e062163852ebc6fb ("twl4030-regulator: Add all TWL
regulators to twreg_info") from the voltage tree.

I cannot begin to fix this mess up.  I do wonder why the regulator patch
above was never in linux-next before being sent upstream yesterday
(Samuel?).  All I can do is use the version of the voltage tree from
next-20091120 (commit id b0a7a2ad0aebb35934de6d2509c73fe93a362c0e) for
today and hope that Liam can do the merge with Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Dec_2009_13_38_08_+1100_youqA_=FLVqnEm/_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksm9pAACgkQjjKRsyhoI8weFACgo6+5JpDlIJlNCapawCxm/rtT
AfUAn3TdFqQ74c8cKutPTFTSy2CIVwSy
=AEq2
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Dec_2009_13_38_08_+1100_youqA_=FLVqnEm/_--
