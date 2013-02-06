From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Wed, 6 Feb 2013 17:59:00 +1100
Message-ID: <20130206175900.3867324b759d8f6f17ef1094@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__6_Feb_2013_17_59_00_+1100_6CRv5LUfJbKPvmow"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:47295 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863Ab3BFG7H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Feb 2013 01:59:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, liguang <lig.fnst@cn.fujitsu.com>

--Signature=_Wed__6_Feb_2013_17_59_00_+1100_6CRv5LUfJbKPvmow
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/mm/mem.c: In function 'arch_add_memory':
arch/powerpc/mm/mem.c:134:2: error: implicit declaration of function '__add=
_pages' [-Werror=3Dimplicit-function-declaration]
arch/powerpc/mm/mem.c: In function 'arch_remove_memory':
arch/powerpc/mm/mem.c:145:2: error: implicit declaration of function '__rem=
ove_pages' [-Werror=3Dimplicit-function-declaration]
arch/powerpc/platforms/pseries/hotplug-memory.c: In function 'pseries_remov=
e_memblock':
arch/powerpc/platforms/pseries/hotplug-memory.c:104:3: error: implicit decl=
aration of function '__remove_pages' [-Werror=3Dimplicit-function-declarati=
on]
mm/bootmem.c: In function 'free_all_bootmem_node':
mm/bootmem.c:269:2: error: implicit declaration of function 'register_page_=
bootmem_info_node' [-Werror=3Dimplicit-function-declaration]

Presumably caused by commit "mm: break circular include from
linux/mmzone.h".  That is a very optimistic patch :-)

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__6_Feb_2013_17_59_00_+1100_6CRv5LUfJbKPvmow
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJREf80AAoJEECxmPOUX5FEw/4P/i31THiCtTo5WeTWLG+hQMmQ
tT6Wwpe8ZndYfoe2Dl1KWyCdoE35qsDpoBihTcZZ6dE7NpAMQb919n344e+gG0VB
a2KL4lKMm1E37/9yA19O2WI73qv1tcda0MugGUzPswuBhsE25sbL2u+gZICN16ke
COWsMzoEeP2/1bpxJnCwB7ancU2KK3Uf3Qkts0vGnT6tOrTfdS7TvaIlg8Zporda
nG8XEE6xuCt+G7Yg7DnfPpXgoY9ax0JqLlzD59+xloBUqlubTymJz8v/wDR4wjQB
gIVEgrmkcBIz7zpphT/bvESY0kbVVTNzD9105PIH91t3gMTNP3ySbkr9YT63/jlZ
TkjPmv+bjTdulLZyBb0uPlWnfK0pywd6R6eZ2afAdadByCAIOgCUmriq+/08j8CN
CJ5PTNybaO3a5auVwM3JVKLtU0p4iAxzVMR2nb7uhJ5ZrGjy7Y3Fh+dkDRtAhw5u
4yT6qagFU2CgeO7gomy3q/1U/Pl01H70aPoeYUybtU1eIzO+GSi2ovs0KBXbMFMa
fuHJh21+uy25XEfqTkEs5EzYTejRvlLU6jiprsLTsdC1wlVuoX0eR4s1DUnds8YW
rk0SvhaS9Vf/WevxSB52uGDv2FtB6huB9VQx7pDKHEOGGSKw8qSUbzSz+h3DtwzO
1PtsKx+WOzf1a3mtWFv4
=ai4o
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Feb_2013_17_59_00_+1100_6CRv5LUfJbKPvmow--
