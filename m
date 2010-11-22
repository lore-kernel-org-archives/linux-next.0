From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (tip tree
 related)
Date: Mon, 22 Nov 2010 13:39:49 +1100
Message-ID: <20101122133949.93201b15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Nov_2010_13_39_49_+1100_Bo4MZxSHjrheV7TG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56897 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756150Ab0KVCkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Nov 2010 21:40:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Don Zickus <dzickus@redhat.com>, David Miller <davem@davemloft.net>

--Signature=_Mon__22_Nov_2010_13_39_49_+1100_Bo4MZxSHjrheV7TG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
failed like this:

arch/sparc/kernel/nmi.c:54: error: redefinition of 'touch_nmi_watchdog'
include/linux/nmi.h:21: note: previous definition of 'touch_nmi_watchdog' w=
as here

Caused (or, at least exposed) by commit
5f2b0ba4d94b3ac23cbc4b7f675d98eb677a760a ("x86, nmi_watchdog: Remove the
old nmi_watchdog").  Sparc appears to have a touch_nmi_watchdog() and
defines ARCH_HAS_NMI_WATCHDOG but not CONFIG_HARDLOCKUP_DETECTOR.


I have reverted that commit for today (as well as commit
072b198a4ad48bd722ec6d203d65422a4698eae7 "x86, nmi_watchdog: Remove all
stub function calls from old nmi_watchdog" that depends on it).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Nov_2010_13_39_49_+1100_Bo4MZxSHjrheV7TG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM6df1AAoJEDMEi1NhKgbsNM8H/1KE56kGOmz31OYgAiONcZex
hO9T4MiELzesrf8RcsvwIZ5/g38BiqYlalpcDp80Na6dLyvURYRJXld4HMgH5Nra
M0fnW5YNBVg+tmZPVgKpZPnhUSm3dwAtibOSryaBoWA2YgV8ipTaKfYC5XhlAp/k
oRUjWPmmNhvC0dq7Sec6Td0TNcvbPjAJpX/bOVvOCj9PnIO1SiWErjogyL9aMPqy
wlwDJekCbprgozvyKNk0IlrxieFCqnZi77JOlj95PYqoBpmZy4dqQ9+DNi3IBWe1
RUUwSkUuz9so83FyNlEQMTa2kK0BF21wrlb37nEC4iDVSAiB67JMcnrCwimcyVs=
=tUJ/
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Nov_2010_13_39_49_+1100_Bo4MZxSHjrheV7TG--
