From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Date: Wed, 5 Sep 2018 11:54:11 +1000
Message-ID: <20180905115411.0c52399c@canb.auug.org.au>
References: <20180905103906.232545a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0/BLZllQuEWZoEPwDtwElt0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905103906.232545a4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/0/BLZllQuEWZoEPwDtwElt0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 Sep 2018 10:39:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the devicetree tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>=20
> WARNING: vmlinux.o(.text+0xf40a16): Section mismatch in reference from th=
e function of_fdt_limit_memory() to the variable .init.data:dt_root_addr_ce=
lls
> The function of_fdt_limit_memory() references
> the variable __initdata dt_root_addr_cells.
> This is often because of_fdt_limit_memory lacks a __initdata=20
> annotation or the annotation of dt_root_addr_cells is wrong.
>=20
> WARNING: vmlinux.o(.text+0xf40a1d): Section mismatch in reference from th=
e function of_fdt_limit_memory() to the variable .init.data:dt_root_size_ce=
lls
> The function of_fdt_limit_memory() references
> the variable __initdata dt_root_size_cells.
> This is often because of_fdt_limit_memory lacks a __initdata=20
> annotation or the annotation of dt_root_size_cells is wrong.
>=20
> Introduced by commit
>=20
>   bb35ea5c7c30 ("of/fdt: avoid re-parsing '#{address,size}-cells' in of_f=
dt_limit_memory")

It turns out that section mismatches are fatal errors in some configs (like=
 powerpc allnoconfig), so I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 5 Sep 2018 11:50:29 +1000
Subject: [PATCH] mark of_fdt_limit_memory() as __init

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/of/fdt.c       | 2 +-
 include/linux/of_fdt.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index fef4b2c8a171..fe78bed8925f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -39,7 +39,7 @@
  * memory entries in the /memory node. This function may be called
  * any time after initial_boot_param is set.
  */
-void of_fdt_limit_memory(int limit)
+void __init of_fdt_limit_memory(int limit)
 {
 	int memory;
 	int len;
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index b9cd9ebdf9b9..19ebf22a7862 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -46,7 +46,7 @@ extern char __dtb_end[];
=20
 /* Other Prototypes */
 extern u64 of_flat_dt_translate_address(unsigned long node);
-extern void of_fdt_limit_memory(int limit);
+extern void __init of_fdt_limit_memory(int limit);
 #endif /* CONFIG_OF_FLATTREE */
=20
 #ifdef CONFIG_OF_EARLY_FLATTREE
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0/BLZllQuEWZoEPwDtwElt0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluPN0MACgkQAVBC80lX
0GzS7Af/RBQCMN/bP3s0wDxbRCf525BXEQntekpzz5H5khG4+vlJ4TAFTdI8G59K
J7ICzb+Ub5GDC7h9y5075BMx8UT9+H3s8dV9xg2OEWEFFPZSG0W5LjgJx+SJ/Vt5
6DLRczr2paZxTU+6PxR6aa8PlDHg84ecsU0jgeEkR7TuMR1nhFfBGkRaP2aQLGVJ
mwg36pu1EbK8w3Rg5o2PwF8GL5S2uRmghwfQRq+uk2Jtz64UtAa0lmuymEEf8h1o
Mzy7cj5oUQjpln+4zVyLiVCV+7Cfz77rDPswSKNlpI9bw9GOVZk7kz7wj0EsWju8
L12KdrR9G6Pu/bUCJYUxAl6rR6XEpw==
=Egvw
-----END PGP SIGNATURE-----

--Sig_/0/BLZllQuEWZoEPwDtwElt0--
