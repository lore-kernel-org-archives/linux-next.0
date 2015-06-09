From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the iommu tree
Date: Tue, 9 Jun 2015 16:57:40 +1000
Message-ID: <20150609165740.651184a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ccy4Ts/3GWKRmKWF23JBm3M"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40932 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932318AbbFIG5m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 02:57:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Jiang Liu <jiang.liu@linux.intel.com>

--Sig_/Ccy4Ts/3GWKRmKWF23JBm3M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
drivers/iommu/dmar.c between commit bc2272dcecae ("iommu/vt-d: Clean up
log messages in intel-iommu.c") from the  tree and commit 34742db8eaf9
("iommu/vt-d: Refine the interfaces to create IRQ for DMAR unit") from
the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/iommu/dmar.c
index a2f50c5f4a2f,536f2d8ea41a..000000000000
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@@ -1642,26 -1642,17 +1642,17 @@@ int dmar_set_interrupt(struct intel_iom
  	if (iommu->irq)
  		return 0;
 =20
- 	irq =3D dmar_alloc_hwirq();
- 	if (irq <=3D 0) {
+ 	irq =3D dmar_alloc_hwirq(iommu->seq_id, iommu->node, iommu);
+ 	if (irq > 0) {
+ 		iommu->irq =3D irq;
+ 	} else {
 -		pr_err("IOMMU: no free vectors\n");
 +		pr_err("No free irq vectors\n");
  		return -EINVAL;
  	}
 =20
- 	irq_set_handler_data(irq, iommu);
- 	iommu->irq =3D irq;
-=20
- 	ret =3D arch_setup_dmar_msi(irq);
- 	if (ret) {
- 		irq_set_handler_data(irq, NULL);
- 		iommu->irq =3D 0;
- 		dmar_free_hwirq(irq);
- 		return ret;
- 	}
-=20
  	ret =3D request_irq(irq, dmar_fault, IRQF_NO_THREAD, iommu->name, iommu);
  	if (ret)
 -		pr_err("IOMMU: can't request irq\n");
 +		pr_err("Can't request irq\n");
  	return ret;
  }
 =20

--Sig_/Ccy4Ts/3GWKRmKWF23JBm3M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdo5kAAoJEMDTa8Ir7ZwVpoAP/jtH4JIWJKzHkiSqMgT+Y880
8b9xsn1NIQtHKXvo0bFdHP2GIwOIb5yZNgnpuXA++TOrtGgOMJ6F0fwyY9z5oTx/
MPJ71TpXVEPPif+5lCczM7e/zsoZqUnUoAbK37JTPdTmTdGSsn1gM0m/+MVF6O+h
P1XI44PefO1W3Y3dyCND35BwhTlu/E7p7cuqSyUarU+v19CeJafldCZIUPrWCQzs
N6dNHBw9aL+ihNBnHx6s5ZbNqw13pHjx9yxd48uiO/g64OITI4InCHWO/0XCYCJ8
+l3uVpKhbwUG3/JzSfFDLOltyrUUUu3jc+wM/kSuh+FY/WXAQVup5I05L4PdzI6a
4rC32c71Ym8VplTlcMzSHcUCqFTfTDAhembGYa/sCsxMJ41fSX9C29eE8dy/RDWv
QXb2UFDuXVqOpgM48QHjpCNmIU5wxn3QiYA6L5zGgnsy4SdPRfn//n4gTMCe20uq
RVEO7YQb7TEB+mH4FgUyH+50SbWZY1MV7rlKcs1ejMC/2F9n2SWRgOF4/Uuiz0PE
Y0tkDTLtMvhj+vHGKlcvERMPAeCZ9cCdobfF/58fJ1ISK/LbLMTX0DoUvwHmzW6O
1NzPPl7JL9UwynMur+JhtwvBqlV9xmo5OX9XjngEyw++10G/36jNxHQk+QiHLHbf
T87E6fo1pNOqT13SZgl0
=2KNm
-----END PGP SIGNATURE-----

--Sig_/Ccy4Ts/3GWKRmKWF23JBm3M--
