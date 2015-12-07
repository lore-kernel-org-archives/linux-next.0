From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Tue, 8 Dec 2015 09:42:16 +1100
Message-ID: <20151208094216.2325ae04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54665 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933048AbbLGWmS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 17:42:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Al,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/usb/core/devio.c:37:0:
drivers/usb/core/devio.c: In function 'usbdev_lseek':
include/linux/fs.h:898:36: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)
 #define MAX_LFS_FILESIZE (((loff_t)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1)
                                    ^
drivers/usb/core/devio.c:162:48: note: in expansion of macro 'MAX_LFS_FILESIZE'
  return no_seek_end_llseek(file, offset, orig, MAX_LFS_FILESIZE);
                                                ^
include/linux/fs.h:898:36: note: each undeclared identifier is reported only once for each function it appears in
 #define MAX_LFS_FILESIZE (((loff_t)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1)
                                    ^
drivers/usb/core/devio.c:162:48: note: in expansion of macro 'MAX_LFS_FILESIZE'
  return no_seek_end_llseek(file, offset, orig, MAX_LFS_FILESIZE);
                                                ^
drivers/usb/core/devio.c:163:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  41fb31e4f962 ("new helper: no_seek_end_llseek()")

PAGE_CACHE_SIZE is defined in linux/pagemap.h which is not included here.
I guess that adding the include to linux/fs.h may have other problems.

I have used the vfs tree from next-20151207 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
