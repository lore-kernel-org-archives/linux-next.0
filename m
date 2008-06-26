From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Thu, 26 Jun 2008 14:21:47 +1000
Message-ID: <20080626142147.ad0e34bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_14_21_47_+1000_.w.y44Z3d0e2nD6G"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40792 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751494AbYFZEV6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 00:21:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__26_Jun_2008_14_21_47_+1000_.w.y44Z3d0e2nD6G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a trivial conflict in
arch/x86/kernel/srat_32.c between commit
885aa5a57fe7c9d7f2c481e1107c3376384dc125 ("x86: numa32 pfn print out
using hex instead") from the x86 tree and commit
5e3d42c632c715fa3076175c39e834223b10c47a ("ACPICA: Update DMAR and SRAT
table definitions") from the acpi tree.

They both changed what a printk was printing.  I fixed it up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_14_21_47_+1000_.w.y44Z3d0e2nD6G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhjGVsACgkQTgG2atn1QN9lMACdEf5eJCkU00k/0F+G8civgDkG
amkAn0AgRbSq9cGpD5rrC/+P+fxqHSdR
=qKHj
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_14_21_47_+1000_.w.y44Z3d0e2nD6G--
