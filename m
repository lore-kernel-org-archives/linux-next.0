From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] libs: force lzma_wrapper to be retained
Date: Fri, 1 Jan 2010 18:33:44 -0800
Message-ID: <20100101183344.398f2538.randy.dunlap@oracle.com>
References: <20100101120737.94d4acc4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:54843 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab0ABCfE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jan 2010 21:35:04 -0500
In-Reply-To: <20100101120737.94d4acc4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

When CONFIG_SQUASHFS=m and CONFIG_DECOMPRESS_LZMA=m, decompress_lzma
is built but then discarded from the library because no built-in code
uses it, so change it from a lib- to an obj- to force it to be kept
in the library.

ERROR: "unlzma" [fs/squashfs/squashfs.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Michal Marek <mmarek@suse.cz>
---
 lib/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100101.orig/lib/Makefile
+++ linux-next-20100101/lib/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_LZO_DECOMPRESS) += lzo/
 
 lib-$(CONFIG_DECOMPRESS_GZIP) += decompress_inflate.o
 lib-$(CONFIG_DECOMPRESS_BZIP2) += decompress_bunzip2.o
-lib-$(CONFIG_DECOMPRESS_LZMA) += decompress_unlzma.o
+obj-$(CONFIG_DECOMPRESS_LZMA) += decompress_unlzma.o
 
 obj-$(CONFIG_TEXTSEARCH) += textsearch.o
 obj-$(CONFIG_TEXTSEARCH_KMP) += ts_kmp.o
