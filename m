From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 9 Jun 2015 17:15:25 +1000
Message-ID: <20150609171525.59a3d737@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FAhmGtOabBU8H_LjogfO6kA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51611 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752981AbbFIHPc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 03:15:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/FAhmGtOabBU8H_LjogfO6kA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:13:0,
                 from include/linux/interrupt.h:5,
                 from drivers/iommu/intel_irq_remapping.c:4:
drivers/iommu/intel_irq_remapping.c: In function 'intel_enable_irq_remappin=
g':
drivers/iommu/intel_irq_remapping.c:656:48: error: 'eim' undeclared (first =
use in this function)
  pr_info("Enabled IRQ remapping in %s mode\n", eim ? "x2apic" : "xapic");
                                                ^

Caused by my mismerge :-(

I added this merge fix patch (and will fix the merge itself tomorrow):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Jun 2015 17:12:00 +1000
Subject: [PATCH] iommu.vt-d: fix mismerge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/intel_irq_remapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_irq_=
remapping.c
index 0d2500d17a2f..c19918471b3a 100644
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@ -653,7 +653,7 @@ static int __init intel_enable_irq_remapping(void)
=20
 	irq_remapping_enabled =3D 1;
=20
-	pr_info("Enabled IRQ remapping in %s mode\n", eim ? "x2apic" : "xapic");
+	pr_info("Enabled IRQ remapping in %s mode\n", eim_mode ? "x2apic" : "xapi=
c");
=20
 	return eim_mode ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/FAhmGtOabBU8H_LjogfO6kA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdpKSAAoJEMDTa8Ir7ZwV/nsQAJF0vaulLmGH5xX1QjlRJUGW
Kn3mtcK1uQ+1eEyDOaUPeTUyoGGgPoWMOTcmET57/2LsEeFeMRAPynZDuEvbgmB0
cfsCkdUL77lFCiSYliZuiubwf2vr1euRkDXpzgwkBMizPozpq2FzpG1z7OT3FPTS
uIrqIzFRehb2u6Acw28Irp8fU8JKNxFR5wdEvjo8UlzCxttk8eAB0BhbsgwUWLfU
Wg82xhcX0AYcfzNFFxCtfpTdYJE8KZ+2B4L2EBDFRSpHW5mfN0rXV8kM/rym5k0Y
FR1GGBv4FQjUixAz2ae56vaKME/smJ1RkXdGRChbTnH2MKdTn6waDU1/dtRTy4yH
3cs+CKmetlwTz8Q6AHx+4HqPdElNDX5cU9xBefiLyUzAJaQEahzISIWTq8vy34kz
GPOzWxwnDeqx1dorlDOH8tFu4Vovf3z188nQEydgpUgYpTHIAyDAXJ4+pG6KdK4h
w2dhX3XnFDEHlfQffHMKCqo+BG5B7uIrz8xwe7El9+wmzksypMnErpBG1dvza24b
PvA4rfhTkZm6bYeySiBk+m1+/mZs4DimRjeTD2Njnd1uuN+JEBR58bAZ4F+UDc1I
26TPExPcnW35Ia+w+FRp9vN3aT1pGxwGRDfZds+YJc23Hqls2d033SnW8lfgyuld
v14731Pg7Xn9OwUYdVhk
=Uyhj
-----END PGP SIGNATURE-----

--Sig_/FAhmGtOabBU8H_LjogfO6kA--
