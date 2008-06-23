From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 23 Jun 2008 14:19:25 +1000
Message-ID: <20080623141925.05a1d214.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_14_19_25_+1000_xxdDfXs.PWv6AwSY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52851 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbYFWETe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 00:19:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Zhao Yakui <yakui.zhao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>

--Signature=_Mon__23_Jun_2008_14_19_25_+1000_xxdDfXs.PWv6AwSY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/process.c between commit
8750bf598db6a0ea3475d1cf8da922b325941e12 ("x86: add C1E aware idle
function") from the x86 tree and commits
bd08eac673842bab79ddaec048012b6e5d4074fd ("ACPI: Create "idle=3Dhalt" boot
parameter") and 5ffc8862cc917ae5107049f3c5fd549fb6c19cac ("ACPI : Create
"idle=3Dnomwait" bootparam") from the acpi tree.

This is just an overlapping additions problem, so I took both in the
obvious manner.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Jun_2008_14_19_25_+1000_xxdDfXs.PWv6AwSY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfJE0ACgkQTgG2atn1QN+w+wCgiK1fjeTIOZRj8SL5QderLE6x
qdoAoJaySM19p3fYPgCPthj3cG9mXmVO
=kJwU
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_14_19_25_+1000_xxdDfXs.PWv6AwSY--
