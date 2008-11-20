From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Thu, 20 Nov 2008 14:24:04 +1100
Message-ID: <20081120142404.7dc7df09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_14_24_04_+1100_X.mykpPsu+G37iE/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59244 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbYKTDYR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 22:24:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Thu__20_Nov_2008_14_24_04_+1100_X.mykpPsu+G37iE/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/s390/include/asm/smp.h arch/s390/kernel/smp.c between commit
32d13157b60c5499c858adaecb6a01873ff9a81a ("[S390] convert s390 to generic
IPI infrastructure") from the s390 tree and commit
0a74a1ee6aaf74b687d649be3196c17f148127ea
("cpumask:smp_call_function_many") from the rr tree.

I think (I may be wrong) that the s390 tree change has removed the need
for the rr tree change to touch the s390 files.  I fixed it up
accordingly and can carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_14_24_04_+1100_X.mykpPsu+G37iE/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkk2FQACgkQjjKRsyhoI8xx3wCfSeMI3hTdQw0sB/OSozqSWErV
gikAoIBz+A8Wo1rwEU04sU7Tfg6qJbjZ
=f8M4
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_14_24_04_+1100_X.mykpPsu+G37iE/--
