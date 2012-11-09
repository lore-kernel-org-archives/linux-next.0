From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Fri, 9 Nov 2012 14:39:21 +1100
Message-ID: <20121109143921.ba7a7d31e17b1db901b4df79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__9_Nov_2012_14_39_21_+1100_0v50tD2MGvcZG92N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43546 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756648Ab2KIDjc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Nov 2012 22:39:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

--Signature=_Fri__9_Nov_2012_14_39_21_+1100_0v50tD2MGvcZG92N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc_ppc64_defcon=
fig)
failed like this:

mm/mmap.c: In function 'SYSC_mmap_pgoff':
mm/mmap.c:1271:15: error: 'MAP_HUGE_SHIFT' undeclared (first use in this fu=
nction)
mm/mmap.c:1271:15: note: each undeclared identifier is reported only once f=
or each function it appears in
mm/mmap.c:1271:33: error: 'MAP_HUGE_MASK' undeclared (first use in this fun=
ction)

Caused by commit 160b36937ca2 ("mm: support more pagesizes for
MAP_HUGETLB/SHM_HUGETLB").

I have reverted that commit for today (along with the two fix patches).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__9_Nov_2012_14_39_21_+1100_0v50tD2MGvcZG92N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQnHrpAAoJEECxmPOUX5FEN6oQAIxvD/4i95FkzSBA4OSDXfAW
Xy0IwovnLj+lO4ZO9IvW5Jvs9YYzzIrDYgHzmC//S+YGQ3lZnWElnlaKyjRnoR3B
691bvQPd2EzZ8gSGkmabs9UE5Kal6mnd8IfYVagrxlUjip9jV+X8mJPF0MHMVPvw
vIvKBItYi4/SSjNJEHqShghxYZ/iM1/D6bBF+Nx/d2uYgWc6A4pIWB52CBM0JVjP
Pjo5XdIBbItudy/j85dD8NAYj4NzdUcTOFI2M4Ukk3BmTtMZPcloHgu/JRNVLrWB
wFTbTJ6c/DjTkaDselNKeeIi7Hs3OIz2Pv+zS/ZujKmMIyNQsp6ccEgNwoJV0DA3
v8C7BgDSuu9JbbRrDoG+JzmK8IRLlRX/+zV1NhuJifa6B7qwE7FVo4XWNDnC3ezj
e0LuOjdnpFY2y/FDBozvWIsxBm8FNwd9FvKVy0+zNC8UV3+e+V/klHPwt0JjkWXD
Uf6hWmhOfNFr80tCEZZRXLuIRomdkSxtTk9P5ontsKaSEPkMeidmgFFqUFa2m7R1
ClCh6kPa7yC0lxC2dOm1qmB26NQOItjB/Mo1D8SioWm4wgDAAQMhhK2XfKwAg3pX
Gm/jnxq01JgmVqvBjbAFqlWsLLXy9ezK8YtsEtGEC9MInC6GQW8PydNkxJ3Jc7ca
+ddFpp/rKfqClo1WoxgV
=1jER
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Nov_2012_14_39_21_+1100_0v50tD2MGvcZG92N--
