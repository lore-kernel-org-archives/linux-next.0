From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the driver-core tree
Date: Fri, 1 Feb 2019 13:41:46 +1100
Message-ID: <20190201134146.0bfd5ba0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lmUdlu=jNXJPqEDeJ+DeG3j"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Gong <richard.gong@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lmUdlu=jNXJPqEDeJ+DeG3j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "__arm_smccc_hvc" [drivers/firmware/stratix10-svc.ko] undefined!
ERROR: "__arm_smccc_smc" [drivers/firmware/stratix10-svc.ko] undefined!

Exposed by commit

  095ff29d2b88 ("firmware: intel_stratix10_service: add hardware dependency=
")

I have added the following partial revert for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 1 Feb 2019 13:37:59 +1100
Subject: [PATCH] firmware: intel_stratix10_service: remove COMPILE_TEST

This does not build yet ...

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 7e5491aed5c8..cac16c4b0df3 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -218,7 +218,7 @@ config FW_CFG_SYSFS_CMDLINE
=20
 config INTEL_STRATIX10_SERVICE
 	tristate "Intel Stratix10 Service Layer"
-	depends on (ARCH_STRATIX10 && HAVE_ARM_SMCCC) || COMPILE_TEST
+	depends on ARCH_STRATIX10 && HAVE_ARM_SMCCC
 	default n
 	help
 	  Intel Stratix10 service layer runs at privileged exception level,
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/lmUdlu=jNXJPqEDeJ+DeG3j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTseoACgkQAVBC80lX
0GyNlggAjvyfwfqu/vDXDZ4bD8SrzOP0wIDWi+xujMJPplSrmMXk8VijnxS0fmOF
rXxcBikI0GVgUi+g6yVTkwmxtkXk3AwloLf68HUM7tW96bLFJf8XmX8jkAULdQ5j
CJ6rYo09oyK3kQIM40I/2zYd+jX9RdDmhn7UEq+RPiEkBB/GDnGIYLX4Nf26YtxA
HW1qbnxPiVbz9z9YgcPYua4bhtpeDApkvQgc5q9kkQ28qHDg2i7TCgUD4JJ5DqHN
RuSNWe//4iAbVogQMEQ4hxfQc9upDqaBkQM0yaKW6Aof7o7LVtNhwtAFFXmXWo5p
vDb+07OnWWZa8kCVbchj1+8QhBlk5Q==
=VwrN
-----END PGP SIGNATURE-----

--Sig_/lmUdlu=jNXJPqEDeJ+DeG3j--
