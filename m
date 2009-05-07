From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the x86 tree
Date: Thu, 7 May 2009 15:54:44 +1000
Message-ID: <20090507155444.47dd74ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48235 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750925AbZEGFzE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 01:55:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
arch/x86/kernel/vmlinux_32.lds.S arch/x86/kernel/vmlinux_64.lds.S between
commit 091e52c3551d3031343df24b573b770b4c6c72b6 ("x86, vmlinux.lds: unify
remaining parts") from the x86 tree and commit
31df83f3f517b8ae49ba1f3fe9d5e3dd108a3e37 ("x86: Provide _sdata in the
vmlinux_*.lds.S files") from the kmemleak tree.

The former commit merges the two files while the latter modifies them.
I applied the patch below to the merged file.  I can carry this as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 4c85b2e..0bbb2d1 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -107,6 +107,7 @@ SECTIONS
 
 	/* Data */
 	. = ALIGN(PAGE_SIZE);
+	_sdata = .;			/* Start of data section */
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
 		CONSTRUCTORS
