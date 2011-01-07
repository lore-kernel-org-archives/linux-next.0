From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the block tree
Date: Fri, 7 Jan 2011 11:02:29 +1100
Message-ID: <20110107110229.c586455a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Jan_2011_11_02_29_+1100_LMIwVyk8S9Sqrqfh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51276 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753156Ab1AGACl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Jan 2011 19:02:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Moyer <jmoyer@redhat.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

--Signature=_Fri__7_Jan_2011_11_02_29_+1100_LMIwVyk8S9Sqrqfh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

kernel/trace/blktrace.c: In function 'blk_register_tracepoints':
kernel/trace/blktrace.c:999: warning: passing argument 1 of 'register_trace=
_block_bio_complete' from incompatible pointer type
include/trace/events/block.h:240: note: expected 'void (*)(void *, struct r=
equest_queue *, struct bio *, int)' but argument is of type 'void (*)(void =
*, struct request_queue *, struct bio *)'
kernel/trace/blktrace.c: In function 'blk_unregister_tracepoints':
kernel/trace/blktrace.c:1038: warning: passing argument 1 of 'unregister_tr=
ace_block_bio_complete' from incompatible pointer type
include/trace/events/block.h:240: note: expected 'void (*)(void *, struct r=
equest_queue *, struct bio *, int)' but argument is of type 'void (*)(void =
*, struct request_queue *, struct bio *)'

Probably caused by commit de983a7bfcb7c020901ca6e2314cf55a4207ab5a
("block: trace event block fix unassigned field").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Jan_2011_11_02_29_+1100_LMIwVyk8S9Sqrqfh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNJlgVAAoJEDMEi1NhKgbsowkH/150slHcEKzsA1v/Y3Ew9ecf
iFXpJjOPLzLOJdufWQFX+QQFyRDin4E1sA0oxb/3dRididlFyte6Zg6eSfFfvvzh
OL9ZITy7MQjSKxh4ZluExTO+CRT4kcKFf/hG1lh6NIa47ELxqDvQ3FV9gHVIxUKv
BDN6NgfLTXcSyOgeFxOLex+uySCmXfe9KxscNveCCd49ZEMToxSbY4lXkAdOp7Yj
iRKdkW48x2jeMVykT3fiMfpBVjecWf3w+wHXj4WggNlC7erg7rE2jcCuTwZyBYPQ
j0/JACqDeJQe1+OHHpNZcGkrNVRarGKQnSeiCwwksBJU7SgV0wGw9SM4ZWbspQU=
=Enlq
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Jan_2011_11_02_29_+1100_LMIwVyk8S9Sqrqfh--
