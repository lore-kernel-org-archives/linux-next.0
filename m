From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the fbdev tree
Date: Wed, 2 Aug 2017 13:24:15 +1000
Message-ID: <20170802132415.4061f3f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751743AbdHBDYR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 23:24:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/video/fbdev/core/fbmem.c

between commit:

  6104c37094e7 ("fbcon: Make fbcon a built-time depency for fbdev")

from the fbdev tree and commit:

  95cf9264d5f3 ("x86, drm, fbdev: Do not specify encrypted memory for video mappings")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/core/fbmem.c
index f8ced1434edf,25e862c487f6..000000000000
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@@ -32,7 -32,7 +32,8 @@@
  #include <linux/device.h>
  #include <linux/efi.h>
  #include <linux/fb.h>
 +#include <linux/fbcon.h>
+ #include <linux/mem_encrypt.h>
  
  #include <asm/fb.h>
  
