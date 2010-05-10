From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 10 May 2010 14:49:07 +1000
Message-ID: <20100510144907.fb4caea9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_May_2010_14_49_07_+1000_xt4hmwf3v8P0uAm_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38595 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751550Ab0EJEtS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 May 2010 00:49:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__10_May_2010_14_49_07_+1000_xt4hmwf3v8P0uAm_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/misc/vmware_balloon.c:44:24: error: asm/vmware.h: No such file or d=
irectory
drivers/misc/vmware_balloon.c: In function 'vmballoon_init':
drivers/misc/vmware_balloon.c:770: error: implicit declaration of function =
'vmware_platform'

Caused by commit e08cae4181af9483b04ecfac48f01c8e5a5f27bf ("x86: Clean up
the hypervisor layer").  (Yes, I know this has already been reported.)

I have used the version of the tip tree from next-20100507 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_May_2010_14_49_07_+1000_xt4hmwf3v8P0uAm_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvnkEMACgkQjjKRsyhoI8zX1QCgqoOO+lM0HBJySI3e0AF+yKFP
560AoIjSuVU4BXwkx1rQ7ijJxTHYXmnR
=wZfx
-----END PGP SIGNATURE-----

--Signature=_Mon__10_May_2010_14_49_07_+1000_xt4hmwf3v8P0uAm_--
