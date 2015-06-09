From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the iommu tree
Date: Tue, 9 Jun 2015 16:57:26 +1000
Message-ID: <20150609165726.5f5440d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eMwSO48/PXXzcq9stf.bsA9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47056 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751025AbbFIG5d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 02:57:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Jiang Liu <jiang.liu@linux.intel.com>

--Sig_/eMwSO48/PXXzcq9stf.bsA9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
drivers/iommu/intel_irq_remapping.c between commits 82a09c904f6a
("iommu/vt-d: Load old data structures only in kdump kernel") and
b1e27c302979 ("iommu/vt-d: Move EIM detection to
intel_prepare_irq_remapping") from the iommu tree and commits
b106ee63abcc ("irq_remapping/vt-d: Enhance Intel IR driver to support
hierarchical irqdomains") and 84bea5cc7709 ("x86/irq: Remove
x86_io_apic_ops.print_entries and related interfaces") from the tip
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/iommu/intel_irq_remapping.c
index b49aa8cf9d13,8fad71cc27e7..000000000000
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@@ -11,7 -8,7 +11,8 @@@
  #include <linux/irq.h>
  #include <linux/intel-iommu.h>
  #include <linux/acpi.h>
 +#include <linux/crash_dump.h>
+ #include <linux/irqdomain.h>
  #include <asm/io_apic.h>
  #include <asm/smp.h>
  #include <asm/cpu.h>
@@@ -118,9 -98,8 +105,8 @@@ static int alloc_irte(struct intel_iomm
  	index =3D bitmap_find_free_region(table->bitmap,
  					INTR_REMAP_TABLE_ENTRIES, mask);
  	if (index < 0) {
 -		pr_warn("IR%d: can't allocate an IRTE\n", iommu->seq_id);
 +		pr_warn("Can't allocate an IRTE for IR[%d]\n", iommu->seq_id);
  	} else {
- 		cfg->remapped =3D 1;
  		irq_iommu->iommu =3D iommu;
  		irq_iommu->irte_index =3D  index;
  		irq_iommu->sub_handle =3D 0;
@@@ -502,10 -413,9 +427,9 @@@ static int intel_setup_irq_remapping(st
 =20
  	pages =3D alloc_pages_node(iommu->node, GFP_KERNEL | __GFP_ZERO,
  				 INTR_REMAP_PAGE_ORDER);
-=20
  	if (!pages) {
 -		pr_err("IR%d: failed to allocate pages of order %d\n",
 -		       iommu->seq_id, INTR_REMAP_PAGE_ORDER);
 +		pr_err("Failed to allocate pages of order %d for IR[%d]\n",
 +		       INTR_REMAP_PAGE_ORDER, iommu->seq_id);
  		goto out_free_table;
  	}
 =20
@@@ -519,41 -439,10 +453,43 @@@
  	ir_table->base =3D page_address(pages);
  	ir_table->bitmap =3D bitmap;
  	iommu->ir_table =3D ir_table;
 +
 +	if (!iommu->qi) {
 +		/*
 +		 * Clear previous faults.
 +		 */
 +		dmar_fault(-1, iommu);
 +		dmar_disable_qi(iommu);
 +		if (dmar_enable_qi(iommu)) {
 +			pr_err("Failed to enable queued invalidation\n");
 +			goto out_free_pages;
 +		}
 +	}
 +
 +	iommu_check_pre_ir_status(iommu);
 +
 +	if (!is_kdump_kernel() && iommu->pre_enabled_ir) {
 +		iommu_disable_irq_remapping(iommu);
 +		iommu->pre_enabled_ir =3D 0;
 +		pr_warn("IRQ remapping was enabled on %s but we are not in kdump mode\n=
",
 +				iommu->name);
 +	}
 +
 +	if (iommu->pre_enabled_ir) {
 +		if (iommu_load_old_irte(iommu))
 +			pr_err("Failed to copy IR table for %s from previous kernel\n",
 +			       iommu->name);
 +		else
 +			pr_info("Copied IR table for %s from previous kernel\n",
 +				iommu->name);
 +	}
 +
 +	iommu_set_irq_remapping(iommu, eim_mode);
 +
  	return 0;
 =20
+ out_free_bitmap:
+ 	kfree(bitmap);
  out_free_pages:
  	__free_pages(pages, INTR_REMAP_PAGE_ORDER);
  out_free_table:
@@@ -709,16 -646,9 +653,9 @@@ static int __init intel_enable_irq_rema
 =20
  	irq_remapping_enabled =3D 1;
 =20
- 	/*
- 	 * VT-d has a different layout for IO-APIC entries when
- 	 * interrupt remapping is enabled. So it needs a special routine
- 	 * to print IO-APIC entries for debugging purposes too.
- 	 */
- 	x86_io_apic_ops.print_entries =3D intel_ir_io_apic_print_entries;
-=20
- 	pr_info("Enabled IRQ remapping in %s mode\n", eim_mode ? "x2apic" : "xap=
ic");
+ 	pr_info("Enabled IRQ remapping in %s mode\n", eim ? "x2apic" : "xapic");
 =20
 -	return eim ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
 +	return eim_mode ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
 =20
  error:
  	intel_cleanup_irq_remapping();

--Sig_/eMwSO48/PXXzcq9stf.bsA9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdo5bAAoJEMDTa8Ir7ZwVos4P/01xfvDZkvSCeM3n0LGPnhNM
hLWy7ycWVRtEpL5bDdOqL275G7khG9VV6ocise4HiKMNsldl1A0dRncqTe5Shorh
ytwHerBN5M+mLjFTn//Dz0nlh93iTBejlWXXVzx+BTvW5j9cl/LKItAkBfwd/3jF
ZquitCh8fZsgIWyAFOwLoY9ZKjmxTaFp9txjL3bpCFN6xdSMvr5yzKW3UJNANR4X
kEn5+52wtwPNa7PiCU6ug/1TosylMum0KZ74ouP0QeMUv4io81tbXwbvlLUvhQoD
SivVxGGSfYtPcJc5Th5rwEYpU6VFZu0V1xXjD4n0ZTkbs6B2jnkXEgzEnp0jYyhu
1NlU0+WWacKc3zfU8LgZ2sMuM5jqLtTDcOq47FSzFSW/GmowMw3L1Vp32VBZoxfh
lBYqzZn3M/eaN0zVL6NKebfCNNsrlvX+YGUKsJ7Uvgdka0LYOs8cnzkuUxtenmCN
qrsl3mG5FvfnpCE463sQ0xHNpXkufZ+4jdiXNWvCYjEYTGZNE/28hPKMxsBgYesk
2YF+VNzbVsVCKpqEQOGTPj+kR9DUGVZKELFQ2k/1cuVjj6//c3s8OMAI1ma1FB8O
dEe8dbugp2ln8BRXBHK1h2H/IHvjBMMOeOgED7Zqy35uQBoWPeXi7YNGBFvh5Vk9
pr7wxrebjSnU+CZ3TqHH
=WMN0
-----END PGP SIGNATURE-----

--Sig_/eMwSO48/PXXzcq9stf.bsA9--
