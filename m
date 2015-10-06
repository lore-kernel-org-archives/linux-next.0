From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 6 Oct 2015 14:07:10 +1100
Message-ID: <20151006140710.68370d9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52349 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbbJFDHM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2015 23:07:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <Marc.Zyngier@arm.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/kernel/acpi.c

between commit:

  f26527b1428f ("irqchip / GIC: Convert the GIC driver to ACPI probing")

from the pm tree and commit:

  89e44b51cc0d ("arm64, acpi/apei: Implement arch_apei_get_mem_attributes()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/kernel/acpi.c
index d6463bba2360,137d537ddceb..000000000000
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@@ -205,3 -210,52 +210,27 @@@ void __init acpi_boot_table_init(void
  			disable_acpi();
  	}
  }
+ 
 -void __init acpi_gic_init(void)
 -{
 -	struct acpi_table_header *table;
 -	acpi_status status;
 -	acpi_size tbl_size;
 -	int err;
 -
 -	if (acpi_disabled)
 -		return;
 -
 -	status = acpi_get_table_with_size(ACPI_SIG_MADT, 0, &table, &tbl_size);
 -	if (ACPI_FAILURE(status)) {
 -		const char *msg = acpi_format_exception(status);
 -
 -		pr_err("Failed to get MADT table, %s\n", msg);
 -		return;
 -	}
 -
 -	err = gic_v2_acpi_init(table);
 -	if (err)
 -		pr_err("Failed to initialize GIC IRQ controller");
 -
 -	early_acpi_os_unmap_memory((char *)table, tbl_size);
 -}
 -
+ #ifdef CONFIG_ACPI_APEI
+ pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+ {
+ 	/*
+ 	 * According to "Table 8 Map: EFI memory types to AArch64 memory
+ 	 * types" of UEFI 2.5 section 2.3.6.1, each EFI memory type is
+ 	 * mapped to a corresponding MAIR attribute encoding.
+ 	 * The EFI memory attribute advises all possible capabilities
+ 	 * of a memory region. We use the most efficient capability.
+ 	 */
+ 
+ 	u64 attr;
+ 
+ 	attr = efi_mem_attributes(addr);
+ 	if (attr & EFI_MEMORY_WB)
+ 		return PAGE_KERNEL;
+ 	if (attr & EFI_MEMORY_WT)
+ 		return __pgprot(PROT_NORMAL_WT);
+ 	if (attr & EFI_MEMORY_WC)
+ 		return __pgprot(PROT_NORMAL_NC);
+ 	return __pgprot(PROT_DEVICE_nGnRnE);
+ }
+ #endif
