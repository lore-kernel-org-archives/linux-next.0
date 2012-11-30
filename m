From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Fri, 30 Nov 2012 17:24:27 +1100
Message-ID: <20121130172427.39c2928ab7cd6cdaca7a9746@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__30_Nov_2012_17_24_27_+1100_kti2i+F5M8GA00L8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39281 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853Ab2K3GYg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Nov 2012 01:24:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>, Oleg Nesterov <oleg@redhat.com>

--Signature=_Fri__30_Nov_2012_17_24_27_+1100_kti2i+F5M8GA00L8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
include/linux/percpu-rwsem.h between commit 4b05a1c74d1c ("percpu-rwsem:
use synchronize_sched_expedited") from Linus' tree and commit
"percpu_rw_semaphore: reimplement to not block the readers unnecessarily"
from the akpm tree.

I fixed it up (using the version from the akpm tree) and can carry the
fix as necessary (more action may be required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__30_Nov_2012_17_24_27_+1100_kti2i+F5M8GA00L8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQuFEbAAoJEECxmPOUX5FE+0IP/22426PhyltPre259Co1C38d
A/C0lVpAwgq4N1od7OxP9JNMS+i2f1lj5BoI1+Zg4gq8DFIEgJUp4D5R8ai5ldy2
s+P2CHoKtar7HWqWNyJOk5oLCQtv4oTyv+XSK60HQ1pAId7XMyEwzwd6BcniSXWe
7/b9cTAZBftCpzKCBEHILVKn4XBQ0EchGygzCi/PQLvvdjx3TVOwDsjA8ocSxNPx
L95e3v+QNLHrySCKznW+p1e9ZshF3pr3dMiNP+5ikqLUS0HUTNTEyEbClq1KOpx6
cCPDsocTOHa2bOcuBlODdrgFCV6CFFYeKtAL0n20DVwpGQGRspLWrXCAWB0gjoN8
Qn/z98gxknvX2HrD9awH1ZIJG85u+GKFtV+IFsKowrEanXdPPs6IpVrLg97wjQza
wqchKxx1zuzBzxyeznjJZ6QEKMKTIcj3fkJktzXXDpZ1Npehy/vjYon5QqGaTfQx
PZUR+N081OBZz6IVfbVgYXCO2DF6q+tpJb5P8kisxpURwC0b5NwDQfQZCjSMwcHe
5sjkX27aIsSgJyFU1S6SpzTYLU1wTBqnGZ9A5rBCg0fv2oO6Z7kAh+kGN+rHKgyM
57RsoTS921PdCLHow+LJFaJQwN3fLYZl5Ssj4Qv7b1FonGAXTMeZJPPAbJc6LH7W
h1w1aOCIFWY4kAI2L8Jp
=WlpG
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Nov_2012_17_24_27_+1100_kti2i+F5M8GA00L8--
