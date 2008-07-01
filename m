From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Tue, 1 Jul 2008 13:53:47 +1000
Message-ID: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49293 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750976AbYGADx5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 23:53:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in  between
commit d752aed810d8c038a9a65819f0ba7c7da7425178 ("x86: rename setup_32.c
to setup.c") from the x86 tree and commit
e3f2baebf4209b5927e23fa65d5977d31db936b3 ("PCI/x86: early dump pci conf
space v2") from the pci tree.

The former merges setup_64.c into setup.c while the latter adds some code
to setup_arch in setup_64.c.  I applied the patch below to setup.c.
Probably worth checking that I did it right.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index fb318ed..0d86814 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -596,6 +596,13 @@ void __init setup_arch(char **cmdline_p)
 
 	parse_early_param();
 
+#ifdef CONFIG_X86_64
+#ifdef CONFIG_PCI
+	if (pci_early_dump_regs)
+		early_dump_pci_devices();
+#endif
+#endif
+
 	if (acpi_mps_check()) {
 #ifdef CONFIG_X86_LOCAL_APIC
 		disable_apic = 1;
