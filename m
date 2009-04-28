From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: [PATCH] lockd: fix FILE_LOCKING=n build error
Date: Tue, 28 Apr 2009 14:15:54 -0400
Message-ID: <1240942554.7376.38.camel@heimdal.trondhjem.org>
References: <20090428165343.2e357d7a.sfr@canb.auug.org.au>
	 <49F71F4A.3080908@oracle.com> <20090428172137.GA22451@fieldses.org>
	 <49F7421A.1090709@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:53968 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752412AbZD1ST2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 14:19:28 -0400
In-Reply-To: <49F7421A.1090709@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <matthew@wil.cx>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Tue, 2009-04-28 at 10:51 -0700, Randy Dunlap wrote:
> J. Bruce Fields wrote:
> > On Tue, Apr 28, 2009 at 08:22:50AM -0700, Randy Dunlap wrote:
> >> From: Randy Dunlap <randy.dunlap@oracle.com>
> >>
> >> lockd/svclock.c is missing a header file <linux/fs.h>.
> >>
> >> <linux/fs.h> is missing a definition of locks_release_private()
> >> for the config case of FILE_LOCKING=n, causing a build error:
> >>
> >> fs/lockd/svclock.c:330: error: implicit declaration of function 'locks_release_private'
> > 
> > LOCKD without FILE_LOCKING doesn't really make sense; would it be better
> > to add a config dependency?
> 
> 
> I just tried a patch like the one below instead of the first one,
> but it has build errors too, so more Makefile/Kconfig work is
> needed (by someone who knows what interfaces are needed here):
> 
> 
> fs/built-in.o: In function `nfs_start_lockd':
> client.c:(.text+0xe8848): undefined reference to `nlmclnt_init'
> fs/built-in.o: In function `nfs_destroy_server':
> client.c:(.text+0xe8885): undefined reference to `nlmclnt_done'
> fs/built-in.o: In function `nfs_proc_lock':
> proc.c:(.text+0xf735f): undefined reference to `nlmclnt_proc'
> fs/built-in.o: In function `nfs3_proc_lock':
> nfs3proc.c:(.text+0xfd1df): undefined reference to `nlmclnt_proc'
> 
> 
> 
> 
> lockd without FILE_LOCKING doesn't make sense, so make LOCKD and
> LOCKD_V4 depend on FILE_LOCKING.
> ---
>  fs/Kconfig     |    2 ++
>  fs/nfs/Kconfig |    2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> --- linux-next-20090428.orig/fs/Kconfig
> +++ linux-next-20090428/fs/Kconfig
> @@ -226,10 +226,12 @@ source "fs/nfsd/Kconfig"
>  
>  config LOCKD
>  	tristate
> +	depends on FILE_LOCKING
>  
>  config LOCKD_V4
>  	bool
>  	depends on NFSD_V3 || NFS_V3
> +	depends on FILE_LOCKING
>  	default y
>  
>  config EXPORTFS
> --- linux-next-20090428.orig/fs/nfs/Kconfig
> +++ linux-next-20090428/fs/nfs/Kconfig
> @@ -1,7 +1,7 @@
>  config NFS_FS
>  	tristate "NFS client support"
>  	depends on INET
> -	select LOCKD
> +	select LOCKD if FILE_LOCKING
>  	select SUNRPC
>  	select NFS_ACL_SUPPORT if NFS_V3_ACL
>  	help

Until someone finds time to go through the code and add in all the
CONFIG_FILE_LOCKING special cases, the above needs to be a 'depends on
INET && FILE_LOCKING'.

Trond
