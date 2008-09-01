From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: revert of "debug: add notifier chain debugging"
Date: Mon, 1 Sep 2008 18:26:19 +1000
Message-ID: <20080901182619.cb799b52.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Sep_2008_18_26_19_+1000_74E0g_SoRoVKtHvn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48376 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751988AbYIAI0c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 04:26:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Mon__1_Sep_2008_18_26_19_+1000_74E0g_SoRoVKtHvn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I have reverted commit 16f9b13de93c8bfdac16b4d15577af2c132358ef ("debug:
add notifier chain debugging") for today hate typing thas it prevents Power=
pc kernels
from booting.  There is (I think) a bug there (__devinit routines are not
put in the right section as pointed otu by David Woodhouse), but not a
fatal bug and the above commit makes it one.

Ingo, Arjan sent you a new version of this patch on Aug 27.

I will have a go at fixing the powerpc bug tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Sep_2008_18_26_19_+1000_74E0g_SoRoVKtHvn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki7pysACgkQjjKRsyhoI8xvWwCcC4Q+qqOC9A69B4EJdFz5aEUr
7EgAoI8+YVhbkTXCnOWjxrhUATaVmeqY
=KXaY
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Sep_2008_18_26_19_+1000_74E0g_SoRoVKtHvn--
