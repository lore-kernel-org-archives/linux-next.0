From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 4 Jul 2011 13:48:42 +1000
Message-ID: <20110704134842.7ab89126.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_Jul_2011_13_48_42_+1000_MvPJjcmSndX.7gU."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753737Ab1GDDsw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jul 2011 23:48:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>, Arnd Bergmann <arnd@arndb.de>

--Signature=_Mon__4_Jul_2011_13_48_42_+1000_MvPJjcmSndX.7gU.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

include/linux/fd.h:6: included file 'linux/compat.h' is not exported

Caused by commit 390192b30057 ("compat_ioctl: fix warning caused by
qemu").

I have used the block tree from next-20110701 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_Jul_2011_13_48_42_+1000_MvPJjcmSndX.7gU.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOETgaAAoJEDMEi1NhKgbsJiUH/1NPpRjt3Q3XW4ltDryCKITt
UonKRDpD51tXlfjhzTf6GQ8lTAW0OpJWCa5SAQ3YmplKEiV1tEJFqFdCQA/sGFf2
e7qgtTDn/MDwdEdPAyfzlEeEE/pT2WeEprdUj2UGvgp3vvN5YW3Flx36hZjWCbM/
unHNONpLbK3QEtX743XL2CyZWE9D8FD62f8bN5Mpi54ayoYVEz8OVS/4cN/QGf+8
OvN/DxrjVVRw0byfdByfzO+8pJad9o4v6WUEbJhCvKCUejoUKti209uF/ga6GWCO
qws6ZdnPJEQyA0Pu2gh/0afLZqGBaTzmIA8CRapLs/YRWwQU8Uyda89X8ErPkpE=
=9Wr0
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Jul_2011_13_48_42_+1000_MvPJjcmSndX.7gU.--
