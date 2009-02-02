From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Subject: Re: [PATCH] jfs: needs crc32_le
Date: Mon, 02 Feb 2009 13:28:45 -0600
Message-ID: <1233602925.5943.1.camel@norville.austin.ibm.com>
References: <20090202201637.28896d2f.sfr@canb.auug.org.au>
	 <20090202112055.5ad37047.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:49294 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752775AbZBBT2w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 14:28:52 -0500
In-Reply-To: <20090202112055.5ad37047.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 2009-02-02 at 11:20 -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> JFS needs crc32_le(), so select its library config symbol:

Thanks Randy.  I'll push this one right away.

Shaggy

> 
> fs/built-in.o: In function `jfs_statfs':
> super.c:(.text+0x7c8c0): undefined reference to `crc32_le'
> super.c:(.text+0x7c8d5): undefined reference to `crc32_le'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Dave Kleikamp <shaggy@austin.ibm.com>
> ---
>  fs/jfs/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20090202.orig/fs/jfs/Kconfig
> +++ linux-next-20090202/fs/jfs/Kconfig
> @@ -1,6 +1,7 @@
>  config JFS_FS
>  	tristate "JFS filesystem support"
>  	select NLS
> +	select CRC32
>  	help
>  	  This is a port of IBM's Journaled Filesystem .  More information is
>  	  available in the file <file:Documentation/filesystems/jfs.txt>.
-- 
David Kleikamp
IBM Linux Technology Center
