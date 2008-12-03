From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Thu, 4 Dec 2008 10:33:07 +1100
Message-ID: <20081204103307.35003f44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_10_33_07_+1100_NZVIAafC_Z89tGR9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42002 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756574AbYLCXdS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 18:33:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Becky Bruce <becky.bruce@freescale.com>

--Signature=_Thu__4_Dec_2008_10_33_07_+1100_NZVIAafC_Z89tGR9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/ieee1394/sbp2.c: In function 'sbp2_create_command_orb':
drivers/ieee1394/sbp2.c:1559: warning: unused variable 'dmadev'

Caused by commit 15e09c0ecaab4a1b4a7ed69db536c38948b92279 ("powerpc: Add
sync_*_for_* to dma_ops") from the powerpc tree.  The macros added for
!CONFIG_PPC_NEED_DMA_SYNC_OPS should really be static inline functions.

(as akpm says: "program in C not C preprocessor").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_10_33_07_+1100_NZVIAafC_Z89tGR9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3FzMACgkQjjKRsyhoI8w+4ACfVmq7owDR3E6zT4FqXb62PvYp
jooAnRncTBjISw1+gdR68K4fmD3C7sJF
=3Udt
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_10_33_07_+1100_NZVIAafC_Z89tGR9--
