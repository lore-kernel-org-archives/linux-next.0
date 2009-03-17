From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the s390 tree
Date: Tue, 17 Mar 2009 13:35:27 +1100
Message-ID: <20090317133527.306e4be1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_13_35_27_+1100_2.+4NEO3v8uYp=4+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57737 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751453AbZCQCfh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 22:35:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Tue__17_Mar_2009_13_35_27_+1100_2.+4NEO3v8uYp=4+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/s390/include/asm/tlbflush.h between commit
e6f19dbd10f5d871750ee3fb03e2e99a06eebf92 ("[S390] cpumask: use mm_cpumask
() wrapper") from the s390 tree and commit
49797d75185490d793bd5bd5db50f143ee8c9d89 ("cpumask:use-mm_cpumask-s390")
from the rr tree.

I assumed that the rr tree version was the correct version and used that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_13_35_27_+1100_2.+4NEO3v8uYp=4+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm/DG8ACgkQjjKRsyhoI8wArACeN8+9P+cCvOpG43o07LW0J+SQ
7roAnjtXqFwzJGjooA1AsmTdV4wGhVIf
=7Y9u
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_13_35_27_+1100_2.+4NEO3v8uYp=4+--
