From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr/x86 merge conflict
Date: Mon, 19 May 2008 15:03:28 +1000
Message-ID: <20080519150328.5913fd84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_15_03_28_+1000_JWqNRXH4xRsrJ7CD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49257 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750831AbYESFDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 01:03:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>

--Signature=_Mon__19_May_2008_15_03_28_+1000_JWqNRXH4xRsrJ7CD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty, Ingo,

Today's linux-next merge of the rr tree got conflicts in
kernel/stop_machine.c and include/linux/stop_machine.h because commit
069d5b32bfe605bd78c2f8b2ee6c63a776592867 from the rr tree and commit
931aa4ee2f3b833e7a0a149126cc92596f7907c6 from the x86 tree ("Add all cpus
option to stop machine run") are essentially the same (though they are
attributed to different authors).  The problem lies in that the rr tree
then has a few more commits that change those files.

I took the versions from the rr tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_15_03_28_+1000_JWqNRXH4xRsrJ7CD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMQosTgG2atn1QN8RAnuqAJ9+iLn33v4Y7+bA3HY7HgLUWW/5dgCeIiIY
P3bldFonOK0WEgrzEtC4pTU=
=VuvR
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_15_03_28_+1000_JWqNRXH4xRsrJ7CD--
