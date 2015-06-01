From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 2 Jun 2015 08:47:46 +1000
Message-ID: <20150602084746.3a931067@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jqbgQBcJAqTvwylYMQJHk3E"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54662 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752852AbbFAWrx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 18:47:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>

--Sig_/jqbgQBcJAqTvwylYMQJHk3E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-socfpga/core.h between commit 02b4e2756e01 ("ARM: v7
setup function should invalidate L1 cache") from the arm tree and
commit 122694a0c712 ("ARM: socfpga: use of_iomap to map the SCU") from
the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-socfpga/core.h
index 767c09e954a0,5913bbb50036..000000000000
--- a/arch/arm/mach-socfpga/core.h
+++ b/arch/arm/mach-socfpga/core.h
@@@ -31,8 -31,8 +31,6 @@@
 =20
  #define RSTMGR_MPUMODRST_CPU1		0x2     /* CPU1 Reset */
 =20
- extern void __iomem *socfpga_scu_base_addr;
 -extern void socfpga_secondary_startup(void);
--
  extern void socfpga_init_clocks(void);
  extern void socfpga_sysmgr_init(void);
 =20

--Sig_/jqbgQBcJAqTvwylYMQJHk3E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbOEXAAoJEMDTa8Ir7ZwVxhIQAIYri3miMYvCRelGYAIlw++a
KKC/gWyDfUrEGGBVulOyXq4AHf/512cbubsSKzmSBr82dW5TUz2yS4elxXB97cou
mSnRkb5FPnbUmh+9VPFNuQnVXrq4T7XbkQPizp5nFFx4hKveFuFRHbL+cNTbbbJ0
R8r4tm/pH3FIAtm10uEvvSbl0VVK6UpSEuEH+oyN9qORKEEV+sv9iVXtuoj8VWDb
1xe7KbQDTy9l0Bky33NpSQlqnuwdj0wuouexowyXplq3Iyb/quluao5AhTf0i/ve
nXLzHTDReCGu2ryII+gHmPoBzUXWiXaQpHj9X8riwm6/trg5/xgrr5c0MSpRdeA2
Z3PF7A1yOgmXM5vggw12yXCby6WMBemH0ItSMONuBg/l69A7DFJNnlMzWMv1hp/x
yelYEKiJfYJLCT7o31xA52oQxW3BPQ+V5TlhWpQ603+59vXSjE01+ZU33505G+1R
Rrq0md/RPRNkVL02nC+nnOpakPkIAGU4/yJuvXq7MySRtPx4B/g1aeXoGRsVgNVV
P452S+KGYwIIQbyYtvVU6jNy/t7L2NoP81qDxDHlTLnLdG2H2GjzZDuqsDW/c8O+
aEz0yS2sEZkfhw2jnutKSRKZY5D9uL3WMWTahScQRWi8WNOofXmUh437sXx3BA8E
FgSlmtvdvugfvXuM6IsX
=RIRH
-----END PGP SIGNATURE-----

--Sig_/jqbgQBcJAqTvwylYMQJHk3E--
