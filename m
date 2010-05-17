From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Mon, 17 May 2010 15:58:02 +1000
Message-ID: <20100517155802.5f82a85c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_May_2010_15_58_02_+1000__GCW4Hf6WIGDaCyv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52097 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753068Ab0EQF6Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 May 2010 01:58:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Breeds <tony@bakeyournoodle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

--Signature=_Mon__17_May_2010_15_58_02_+1000__GCW4Hf6WIGDaCyv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging-next tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/mutex.c: In function '__mutex_lock_common':
kernel/mutex.c:148: warning: unused variable 'timeout'

Introduced by commit 227945799cc10d77c6ef812f3eb8a61a78689454 ("mutex:
Fix optimistic spinning vs. BKL") for a build with
CONFIG_MUTEX_SPIN_ON_OWNER not set.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_May_2010_15_58_02_+1000__GCW4Hf6WIGDaCyv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvw2uoACgkQjjKRsyhoI8xedACfbcDygqdoPEZC1kqUQjGYjrQ4
PAMAn3y8FpxAzvdoXmRUCVubmDC/ijFw
=WSTo
-----END PGP SIGNATURE-----

--Signature=_Mon__17_May_2010_15_58_02_+1000__GCW4Hf6WIGDaCyv--
