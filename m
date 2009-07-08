From: Feng Tang <feng.tang@intel.com>
Subject: Re: [SFI-devel] linux-next: sfi tree build warning
Date: Wed, 8 Jul 2009 14:57:40 +0800
Message-ID: <20090708145740.0e5e4b07@feng-desktop>
References: <20090708164400.f2138d79.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:29117 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752318AbZGHG7V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 02:59:21 -0400
In-Reply-To: <20090708164400.f2138d79.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "sfi-devel@simplefirmware.org" <sfi-devel@simplefirmware.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 8 Jul 2009 14:44:00 +0800
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> arch/x86/kernel/sfi.c: In function 'sfi_init_memory_map':
> arch/x86/kernel/sfi.c:99: warning: cast to pointer from integer of
> different size arch/x86/kernel/sfi.c:100: warning: cast to pointer
> from integer of different size
> 
Hi Stephen,

Thanks for the finding. Could you help to test the following quick patch?
it should works for both x86_32 and x86_64. thanks

- Feng 

diff --git a/arch/x86/kernel/sfi.c b/arch/x86/kernel/sfi.c
index a96ea0f..b23e489 100644
--- a/arch/x86/kernel/sfi.c
+++ b/arch/x86/kernel/sfi.c
@@ -96,8 +96,9 @@ int __init sfi_init_memory_map(void)
	/* walk through the syst to search the mmap table */
	mmapt = NULL;
	for (i = 0; i < tbl_cnt; i++) {
-		if (!strncmp(SFI_SIG_MMAP, (char *)(u32)*pentry, 4)) {
-			mmapt = (struct sfi_table_simple *)(u32)*pentry;
+		if (!strncmp(SFI_SIG_MMAP, (char *)(unsigned long)*pentry, 4)) {
+			mmapt = (struct sfi_table_simple *)
+					(unsigned long)*pentry;
			break;
                }
		pentry++;
