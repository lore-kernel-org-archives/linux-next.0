From: Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for pnp_acpi_device
Date: Wed, 21 Jan 2015 21:40:15 +0100
Message-ID: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:56270 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751546AbbAUUi1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 15:38:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>, Peter Huewe <peterhuewe@gmx.de>

This fixes a build failure if CONFIG_PNP is set but CONFIG_ACPI is not:
drivers/char/tpm/tpm_tis.c: In function =E2=80=98tpm_tis_pnp_init=E2=80=
=99:
drivers/char/tpm/tpm_tis.c:912:45: error: invalid type argument of
=E2=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
   acpi_dev_handle =3D pnp_acpi_device(pnp_dev)->handle;

If CONFIG_PNPACPI is not set pnp_acpi_device is defined as 0 and thus
accesing the handle is not possible.

=46ixes: 0dc553652102 ("tpm: fix raciness of PPI interface lookup")
Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/char/tpm/tpm_tis.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 20a61bc98db8..6725bef7cb96 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -908,8 +908,10 @@ static int tpm_tis_pnp_init(struct pnp_dev *pnp_de=
v,
 	if (is_itpm(pnp_dev))
 		itpm =3D true;
=20
+#ifdef CONFIG_ACPI
 	if (pnp_acpi_device(pnp_dev))
 		acpi_dev_handle =3D pnp_acpi_device(pnp_dev)->handle;
+#endif
=20
 	return tpm_tis_init(&pnp_dev->dev, acpi_dev_handle, start, len, irq);
 }
--=20
2.0.5
