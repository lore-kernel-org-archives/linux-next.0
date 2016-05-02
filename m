From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Mon, 2 May 2016 14:51:01 +1000
Message-ID: <20160502145101.151ea253@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58100 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738AbcEBEvD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 00:51:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org. Shannon Zhao" <shannon.zhao@linaro.org>, Matt Fleming <matt@codeblueprint.co.uk>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/xen/efi.c

between commit:

  0ec7ae928a9c ("efi: Remove unnecessary (and buggy) .memmap initialization from the Xen EFI driver")

from the tip tree and commit:

  acb2c923a860 ("XEN: EFI: Move x86 specific codes to architecture directory")

from the xen-tip tree.

I fixed it up (I used the xen-tip version of this file and added the below
merge fix patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 May 2016 14:47:32 +1000
Subject: [PATCH] xen: efi: merge fix patch

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/efi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 86527f1d1427..3be012115853 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -83,7 +83,6 @@ static const struct efi efi_xen __initconst = {
 	.get_next_high_mono_count = xen_efi_get_next_high_mono_count,
 	.reset_system             = NULL, /* Functionality provided by Xen. */
 	.set_virtual_address_map  = NULL, /* Not used under Xen. */
-	.memmap                   = NULL, /* Not used under Xen. */
 	.flags			  = 0     /* Initialized later. */
 };
 
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
