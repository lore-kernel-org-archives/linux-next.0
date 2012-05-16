From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the arm tree
Date: Wed, 16 May 2012 15:14:41 +1000
Message-ID: <20120516151441.59baed915e31738642fd52dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__16_May_2012_15_14_41_+1000_WvO5wi7SE//BvnSk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <rmk@arm.linux.org.uk>, Andreas Westin <andreas.westin@stericsson.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__16_May_2012_15_14_41_+1000_WvO5wi7SE//BvnSk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in
arch/arm/mach-ux500/devices-common.h between commit 08956a0e8a69 ("ARM:
7372/1: ux500: factor out dynamic amba device allocator") from the  tree
and commit 585d188f8072 ("mach-ux500: crypto - core support for CRYP/HASH
module") from the crypto tree.

Just context changes (maybe).  I fixed it up (see below) and can carry
the fix as necessary.

I suspect that there may be something deeper here, though.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-ux500/devices-common.h
index f75bcb2,89c5a59..0000000
--- a/arch/arm/mach-ux500/devices-common.h
+++ b/arch/arm/mach-ux500/devices-common.h
@@@ -11,8 -11,17 +11,13 @@@
  #include <linux/platform_device.h>
  #include <linux/dma-mapping.h>
  #include <linux/sys_soc.h>
 +#include <linux/amba/bus.h>
  #include <plat/i2c.h>
+ #include <mach/crypto-ux500.h>
+=20
 -extern struct amba_device *
 -dbx500_add_amba_device(struct device *parent, const char *name,
 -		       resource_size_t base, int irq, void *pdata,
 -		       unsigned int periphid);
 -
+ extern struct platform_device *
+ dbx500_add_platform_device_noirq(const char *name, int id,
+ 		resource_size_t base, void *pdata);
 =20
  struct spi_master_cntlr;
 =20
@@@ -81,10 -90,58 +86,59 @@@ dbx500_add_i2c(struct device *parent, i
  static inline struct amba_device *
  dbx500_add_rtc(struct device *parent, resource_size_t base, int irq)
  {
 -	return dbx500_add_amba_device(parent, "rtc-pl031", base, irq, NULL, 0);
 +	return amba_apb_device_add(parent, "rtc-pl031", base, SZ_4K, irq,
 +				0, NULL, 0);
  }
 =20
+ struct cryp_platform_data;
+=20
+ static inline struct platform_device *
+ dbx500_add_cryp1(struct device *parent, int id, resource_size_t base, int=
 irq,
+ 		struct cryp_platform_data *pdata)
+ {
+ 	struct resource res[] =3D {
+ 			DEFINE_RES_MEM(base, SZ_4K),
+ 			DEFINE_RES_IRQ(irq),
+ 	};
+=20
+ 	struct platform_device_info pdevinfo =3D {
+ 			.parent =3D parent,
+ 			.name =3D "cryp1",
+ 			.id =3D id,
+ 			.res =3D res,
+ 			.num_res =3D ARRAY_SIZE(res),
+ 			.data =3D pdata,
+ 			.size_data =3D sizeof(*pdata),
+ 			.dma_mask =3D DMA_BIT_MASK(32),
+ 	};
+=20
+ 	return platform_device_register_full(&pdevinfo);
+ }
+=20
+ struct hash_platform_data;
+=20
+ static inline struct platform_device *
+ dbx500_add_hash1(struct device *parent, int id, resource_size_t base,
+ 		struct hash_platform_data *pdata)
+ {
+ 	struct resource res[] =3D {
+ 			DEFINE_RES_MEM(base, SZ_4K),
+ 	};
+=20
+ 	struct platform_device_info pdevinfo =3D {
+ 			.parent =3D parent,
+ 			.name =3D "hash1",
+ 			.id =3D id,
+ 			.res =3D res,
+ 			.num_res =3D ARRAY_SIZE(res),
+ 			.data =3D pdata,
+ 			.size_data =3D sizeof(*pdata),
+ 			.dma_mask =3D DMA_BIT_MASK(32),
+ 	};
+=20
+ 	return platform_device_register_full(&pdevinfo);
+ }
+=20
  struct nmk_gpio_platform_data;
 =20
  void dbx500_add_gpios(struct device *parent, resource_size_t *base, int n=
um,

--Signature=_Wed__16_May_2012_15_14_41_+1000_WvO5wi7SE//BvnSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPszfBAAoJEECxmPOUX5FE6JoP/177qzS5K22xgfToSwbW0d/T
K8rrsJ7ia/64JQOVsH5SMDb8tIiRQ5SOJMbVnFgaN4AP1USZyXye7jXQaKEMEXRD
S0SwZVERv5POutG2eeuX+AtW1U8UkMLV3kWew5X/3BvmwqdSmMcxaYEcV3Qh0eAC
5kbOP6dv8C0V8keFv3jA8k/wv8DJS9oIcLibkdt7QCf1MdfU6lVdsOi6Xcd1Rc7b
AOUVfxhJ8XSImFnAGRM98/gcYRPXvw4mmLzrPEppIVBX8uXYtVWWWhNBCXX7Yx/N
QS5Mpw5Om0+QNZgYTOExnQPadncj/pVcMtUQQrmdLqQFtZngYa6FyD7AkH7gXaTT
mbuNdC1iJTKp3P5I6uDQuAzpLziqK6zkiUpwfqlPZUN/pPQMFvxed4yX/+nM08+S
ke9U04mc/Y16KVZK6WAjnGl+mGJlN63JvDHs2CTykUr/5Uqh2XMGiMRkCEPTXgkL
gV4vvuSPvDRHOUn9cH+WyHtoD94S6LeiDdexyGSGcfzGzCK/tL0caVkbNWfFpXRP
pi4j3dlWTdZ+RfDLeyFWNAmzXZhIe7J80++IaVBt0YF98mlQIrg7skGMXvIjjSsw
uR0iQCeyCSlQeLc92ai2JGyObzZXpHG8mdiEqTAjB7Gjm06xyzithxVg8sxP2+hT
Pyk+nuDdPprUbo/Xn3fK
=KZeq
-----END PGP SIGNATURE-----

--Signature=_Wed__16_May_2012_15_14_41_+1000_WvO5wi7SE//BvnSk--
