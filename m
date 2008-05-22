From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bkl-removal/arm merge conflict
Date: Thu, 22 May 2008 15:21:57 +1000
Message-ID: <20080522152157.57dac9f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_May_2008_15_21_57_+1000_3DRz3Q+HMieukII5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40749 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753218AbYEVFWI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 01:22:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Thu__22_May_2008_15_21_57_+1000_3DRz3Q+HMieukII5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Today's linux-next merge of the bkl-removal tree got a conflict in
arch/arm/common/rtctime.c between commit
b204d462d7eae31413c5ac80ec3a32a89765fd46 ("[RTC] remove old ARM rtc
library code") from the arm tree and commit
f6f28a87d5f4ae2b101e64ab494267f6858631c4 ("arm-common-rtctime: BKL
pushdown") from the bkl-removal tree.

The former removed the file which is what I did in linux-next.

Jon, you may want to remove or revert that commit from your tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_May_2008_15_21_57_+1000_3DRz3Q+HMieukII5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFINQL6TgG2atn1QN8RAjF7AJ9Zly89gClY6yK97ASpU1ErUiqwTACfdSya
xuq/OozfnujLwtM+2YAdhuM=
=nUXH
-----END PGP SIGNATURE-----

--Signature=_Thu__22_May_2008_15_21_57_+1000_3DRz3Q+HMieukII5--
