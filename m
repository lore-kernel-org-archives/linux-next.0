From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 8 May 2017 13:48:05 +1000
Message-ID: <20170508134805.474af605@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750926AbdEHDsI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 May 2017 23:48:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stafford Horne <shorne@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  init/initramfs.c

between commit:

  17a9be317475 ("initramfs: Always do fput() and load modules after rootfs populate")

from Linus' tree and commit:

  c25cfb52513b ("initramfs: provide a way to ignore image provided by bootloader")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc init/initramfs.c
index 8daf7ac6c7e2,a5b686696535..000000000000
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@@ -612,8 -611,7 +612,8 @@@ static int __init populate_rootfs(void
  	char *err = unpack_to_rootfs(__initramfs_start, __initramfs_size);
  	if (err)
  		panic("%s", err); /* Failed to decompress INTERNAL initramfs */
 +	/* If available load the bootloader supplied initrd */
- 	if (initrd_start) {
+ 	if (initrd_start && !IS_ENABLED(CONFIG_INITRAMFS_FORCE)) {
  #ifdef CONFIG_BLK_DEV_RAM
  		int fd;
  		printk(KERN_INFO "Trying to unpack rootfs image as initramfs...\n");
