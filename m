From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (tip tree
 related)
Date: Tue, 14 Sep 2010 00:29:32 +1000
Message-ID: <20100914002932.850d02f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Sep_2010_00_29_32_+1000_KENko8ZxBOcKT4i2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55048 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750970Ab0IMO3j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Sep 2010 10:29:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@arm.linux.org.uk>

--Signature=_Tue__14_Sep_2010_00_29_32_+1000_KENko8ZxBOcKT4i2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (arm
assabet_defconfig and serveral other arm configs) failed like this:

arch/arm/mm/init.c: In function 'arm_memory_present':
arch/arm/mm/init.c:260: warning: ISO C90 forbids mixed declarations and code
arch/arm/mm/init.c:338: error: invalid storage class for function 'free_are=
a'
arch/arm/mm/init.c:357: error: invalid storage class for function 'free_mem=
map'
arch/arm/mm/init.c:386: error: invalid storage class for function 'free_unu=
sed_memmap'
arch/arm/mm/init.c:601: error: invalid storage class for function 'keepinit=
rd_setup'
arch/arm/mm/init.c:606: error: initializer element is not constant
arch/arm/mm/init.c:606: error: (near initialization for '__setup_keepinitrd=
_setup.setup_func')
arch/arm/mm/init.c:606: error: expected declaration or statement at end of =
input
arch/arm/mm/init.c:252: warning: unused variable 'i'

Caused by commit 719c1514f2fef5f01fcfa2bba81b7bb079c7c6a1 ("memblock/arm:
Use new accessors") which forgot a closing brace on a new
for_each_memblock() in arm_memory_present().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Sep_2010_00_29_32_+1000_KENko8ZxBOcKT4i2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMjjVMAAoJEDMEi1NhKgbs6SEH/ApGQ05bDflgCN9gD4qslw94
KMqY1z67cYK90Akj0wx5cshotHdQEcXx4baCTfRIBqvEdlhOjn4o8B6KC5t1mrlf
gonuoFTCHVhyZ6EBWItp5YgHNpsKM11meQIX1Odwt1z3au6pi1FFzOB++rWwVWKp
rXr0W9ZqareuUi/W4hsa2Ura/tsG/gwu82vXj6dmGozygkwsyC41adiwG2XTFz/k
nASFFKq1xjjNiA2xjM9txP7dlny/ihmDcV/MoLXNjB5eG9lwCW4YFO3CHXbX/NKz
fwoWbZhEwAehz/opbJrsQI7mJauxFS/k3USwe/popJMLxxOh9wtYabkmWokba5o=
=Oc/2
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Sep_2010_00_29_32_+1000_KENko8ZxBOcKT4i2--
