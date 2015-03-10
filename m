From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 10 Mar 2015 16:07:28 +1100
Message-ID: <20150310160728.7213b9fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KvJEpJn2nCABMe3I1y=HHFA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52044 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbbCJFHh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 01:07:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

--Sig_/KvJEpJn2nCABMe3I1y=HHFA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/module.h:17:0,
                 from drivers/staging/sm750fb/sm750.c:2:
drivers/staging/sm750fb/sm750.c: In function '__check_g_option':
drivers/staging/sm750fb/sm750.c:1436:14: error: 'g_option' undeclared (firs=
t use in this function)
 module_param(g_option,charp,S_IRUGO);
              ^

Caused by commit 81dee67e215b ("staging: sm750fb: add sm750 to staging").

This driver also produced a large number of warnings ... a lot like this:

drivers/staging/sm750fb/sm750.c: In function 'lynxfb_ops_mmap':
drivers/staging/sm750fb/sm750.c:533:2: warning: format '%x' expects argumen=
t of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wfo=
rmat=3D]
  printk("lynxfb mmap pgoff: %x\n", vma->vm_pgoff);
  ^

Also note:

In file included from drivers/staging/sm750fb/ddk750_mode.h:4:0,
                 from drivers/staging/sm750fb/ddk750.h:15,
                 from drivers/staging/sm750fb/sm750_hw.c:24:
drivers/staging/sm750fb/ddk750_chip.h:4:0: warning: "SM750LE_REVISION_ID" r=
edefined
 #define SM750LE_REVISION_ID (char)0xfe
 ^
In file included from drivers/staging/sm750fb/sm750_hw.c:23:0:
drivers/staging/sm750fb/sm750_hw.h:8:0: note: this is the location of the p=
revious definition
 #define SM750LE_REVISION_ID (unsigned char)0xfe
 ^

I have disabled this driver for now, please let me know when it is OK
to enable it again.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 10 Mar 2015 16:02:45 +1100
Subject: [PATCH] staging: disable the Silicon Motion SM750 framebuffer supp=
ort

due to build problems

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/sm750fb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kcon=
fig
index c40d088a4d3b..24f3a7f787da 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -1,6 +1,7 @@
 config FB_SM750
 	tristate "Silicon Motion SM750 framebuffer support"
 	depends on FB && PCI
+	depends on BROKEN
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
 	  with 2D accelearion and dual head support.
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/KvJEpJn2nCABMe3I1y=HHFA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/nwVAAoJEMDTa8Ir7ZwVTCYQAI0FwHuXzLsOh+Mj1a8DX3Fd
X7H09dAf/N6++2zeWGiWKjdiTnFhi0OeGOydZdxYedE4AKftikJyaUVxZldqQn/i
ZpRSrkSb+ozaPTPmtVgD/if6vD5YPExJA29KF18VTPqjN52UcHk5/I6iqR/lZ0ku
JwBRqlhvZu01fRLthhlP71lrNaphWn/h8jE77WkmYE83TTxr9xcBp6sdqK1lsnNp
Y9modS/JtaY14U6ryq2AMg+pUzkF7uU6S+QHnBLmYuiCGshQYrv9XW57oT4HOHL7
JuC5Kh9d1QMkUcOEhDzhAOhIsKEX9HaNQqtKXuuHSqbDCgEpfybO0VcoClHYQfW+
AAynGsjmx7NDdFvNl6XaY2QE/sdLZvkd6TUpqs6Zwmroli3hfZ83tRm9e8WsqPMA
Ygv9k7BU1xYYaBCSLEP/r/9Vrt59++k7OYG9QHHYWRkPy3HGoI1RmhDqYOsD7r0a
QmZwKKfqB1cCsYjlv1RCpU6VEaL2tXOBOUbp3VNxlfaJDTUUssPynAhXYgSawNTs
U6XloVu8zz9Jpow1PFv82UwF3JojnB8ge/XgvMBWMftjfvEgGR4vaJ1V9MuO5bWD
Gkb9q9tJCoqOITMqlgaM9k941gxBDuD7TVunj//gAjr5AJtuw0OGEAOQwJF4D6/f
WJT1+ukCtVU5VNU1rzW3
=y0uf
-----END PGP SIGNATURE-----

--Sig_/KvJEpJn2nCABMe3I1y=HHFA--
