From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Wed, 4 Feb 2015 18:48:18 +1100
Message-ID: <20150204184818.0fe47255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ldM0hhUT+GWxl9e_e/iQ3yt"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52780 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751716AbbBDHs3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2015 02:48:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>

--Sig_/ldM0hhUT+GWxl9e_e/iQ3yt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

warning: (GDB_SCRIPTS) selects DEBUG_INFO which has unmet direct dependenci=
es (DEBUG_KERNEL && !COMPILE_TEST)
warning: (GDB_SCRIPTS) selects DEBUG_INFO which has unmet direct dependenci=
es (DEBUG_KERNEL && !COMPILE_TEST)

Introduced by commit 3cf8bb219e44 ("scripts/gdb: add infrastructure").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ldM0hhUT+GWxl9e_e/iQ3yt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0c7LAAoJEMDTa8Ir7ZwVN0sP/2lZqwGHlV8Xf7wpbjW19Ltj
fSdTJO0wej6cRon+dxQbHUd1NSj2rnAMdo4gCMOtzAKWhdhjixYnPtxtrpYSPWJO
DgBBRcGj2Wn6WaxDcJEifG55WtReGmBoXxo1mrloVo3uLMOGLaWuT4XbgmOaR0be
Fe0gRH0H8OAPFPbITjLE9Vf6UQL9NbZwhnMlP2dmk1jjJ1IcRi/Gs5F4V795NhvO
JsSgnpFsVtNszYG8FPaXfOorexqFpP+X0DZzzqrLWxG2zNufqNmd1m46f70DFau+
TWpfwrypX6XX9rYf+9lVYV0piFgbdYU/bUdA8bpQEQzwvmtjllrTnReMbhkL/Flt
xqTgUlPMZKSuMQhSoLresebL+R4Iix2iu2aVMb9hlfYESOjrs3zULdW7XdDQ/1dX
PwLZu292/4B35ZxExHiBvf8bGxB3QaSH7NiEamazSPbbMV/TR+75vBkpzViecGqm
Z5YYCGL/mfoUTFKT71mbDnbB3WFLPTpxdLx+FU7H2ncCKW7xwZ5oWElmQ9g3wE0T
bXNjGT/NYXFjv5NhUTDE+g1KE80GNspfjLLB0wLHIt22D7AffnuigIZ9WHZst41S
VMrg5TN3kjwmQ+5Gsyfm3dZ+YOLwfcfq/wDEjuZ3wD1/aXpVTp4/ylC4F7RD+mTb
OC+LzhYqq2+GRmIKhpIt
=YAwY
-----END PGP SIGNATURE-----

--Sig_/ldM0hhUT+GWxl9e_e/iQ3yt--
