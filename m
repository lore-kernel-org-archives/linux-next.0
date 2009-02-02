From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] jfs: needs crc32_le
Date: Mon, 2 Feb 2009 11:20:55 -0800
Message-ID: <20090202112055.5ad37047.randy.dunlap@oracle.com>
References: <20090202201637.28896d2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755068AbZBBTWK@vger.kernel.org>
In-Reply-To: <20090202201637.28896d2f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Kleikamp <shaggy@austin.ibm.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

JFS needs crc32_le(), so select its library config symbol:

fs/built-in.o: In function `jfs_statfs':
super.c:(.text+0x7c8c0): undefined reference to `crc32_le'
super.c:(.text+0x7c8d5): undefined reference to `crc32_le'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Dave Kleikamp <shaggy@austin.ibm.com>
---
 fs/jfs/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090202.orig/fs/jfs/Kconfig
+++ linux-next-20090202/fs/jfs/Kconfig
@@ -1,6 +1,7 @@
 config JFS_FS
 	tristate "JFS filesystem support"
 	select NLS
+	select CRC32
 	help
 	  This is a port of IBM's Journaled Filesystem .  More information is
 	  available in the file <file:Documentation/filesystems/jfs.txt>.
