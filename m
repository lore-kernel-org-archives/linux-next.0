From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc build failure
Date: Thu, 27 Nov 2008 01:34:05 +1100
Message-ID: <20081127013405.fcdaaed2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__27_Nov_2008_01_34_05_+1100_mDxO8c6=XBgkb=W+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51954 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752148AbYKZOeV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 09:34:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulus@samba.org
Cc: linux-next@vger.kernel.org

--Signature=_Thu__27_Nov_2008_01_34_05_+1100_mDxO8c6=XBgkb=W+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/built-in.o: In function `get_dma_ops':
arch/powerpc/include/asm/dma-mapping.h:97: relocation truncated to fit: R_P=
PC64_REL24 against symbol `.ftrace_likely_update' defined in .text section =
in kernel/built-in.o
drivers/built-in.o: In function `init_shadow_tids':
drivers/infiniband/hw/ipath/ipath_init_chip.c:457: relocation truncated to =
fit: R_PPC64_REL24 against symbol `.vfree' defined in .text section in mm/b=
uilt-in.o
drivers/built-in.o: In function `bringup_link':
drivers/infiniband/hw/ipath/ipath_init_chip.c:186: relocation truncated to =
fit: R_PPC64_REL24 against symbol `.ftrace_likely_update' defined in .text =
section in kernel/built-in.o
drivers/built-in.o: In function `eeh_readq':
arch/powerpc/include/asm/eeh.h:145: relocation truncated to fit: R_PPC64_RE=
L24 against symbol `.eeh_check_failure' defined in .text section in arch/po=
werpc/platforms/built-in.o
arch/powerpc/include/asm/eeh.h:145: relocation truncated to fit: R_PPC64_RE=
L24 against symbol `.eeh_check_failure' defined in .text section in arch/po=
werpc/platforms/built-in.o
drivers/built-in.o: In function `create_port0_egr':
drivers/infiniband/hw/ipath/ipath_init_chip.c:92: relocation truncated to f=
it: R_PPC64_REL24 against symbol `.vmalloc' defined in .text section in mm/=
built-in.o
drivers/infiniband/hw/ipath/ipath_init_chip.c:114: relocation truncated to =
fit: R_PPC64_REL24 against symbol `.vfree' defined in .text section in mm/b=
uilt-in.o
drivers/built-in.o: In function `enable_chip':
drivers/infiniband/hw/ipath/ipath_init_chip.c:477: relocation truncated to =
fit: R_PPC64_REL24 against symbol `.init_waitqueue_head' defined in .text s=
ection in kernel/built-in.o
drivers/built-in.o: In function `eeh_readq':
arch/powerpc/include/asm/eeh.h:145: relocation truncated to fit: R_PPC64_RE=
L24 against symbol `.eeh_check_failure' defined in .text section in arch/po=
werpc/platforms/built-in.o
drivers/built-in.o: In function `eeh_readl':
arch/powerpc/include/asm/eeh.h:137: relocation truncated to fit: R_PPC64_RE=
L24 against symbol `.eeh_check_failure' defined in .text section in arch/po=
werpc/platforms/built-in.o
drivers/built-in.o: In function `get_dma_ops':
arch/powerpc/include/asm/dma-mapping.h:97: additional relocation overflows =
omitted from the output

I have no idea why.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__27_Nov_2008_01_34_05_+1100_mDxO8c6=XBgkb=W+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkktXl0ACgkQjjKRsyhoI8xsogCdEnN1V9ONWFDEZ1t0l0z6M1oT
e9sAoICx+hjs26y4BFm0+bIL/vuEgrEz
=1wWD
-----END PGP SIGNATURE-----

--Signature=_Thu__27_Nov_2008_01_34_05_+1100_mDxO8c6=XBgkb=W+--
