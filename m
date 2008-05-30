From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: next 20080530: ubifs build errors
Date: Fri, 30 May 2008 09:31:47 -0700
Message-ID: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:37858 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219AbYE3QSv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2008 12:18:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, dedekind@infradead.org
Cc: linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>

with:
CONFIG_UBIFS_FS=y
# CONFIG_UBIFS_FS_XATTR is not set
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
# CONFIG_UBIFS_FS_LZO is not set
# CONFIG_UBIFS_FS_ZLIB is not set
# CONFIG_UBIFS_FS_DEBUG is not set

build gets:
fs/built-in.o: In function `compr_exit':
compress.c:(.text+0x4a3fc): undefined reference to `crypto_free_tfm'
fs/built-in.o: In function `compr_init':
compress.c:(.init.text+0x11d4): undefined reference to `crypto_alloc_base'
make[1]: *** [.tmp_vmlinux1] Error 1


because CRYPTO is not enabled.

---
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
