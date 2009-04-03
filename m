From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: vfs tree build failure
Date: Fri, 3 Apr 2009 15:43:42 +1100
Message-ID: <20090403154342.b2d72cf6.sfr@canb.auug.org.au>
References: <20090402131211.32420d4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50417 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754922AbZDCEns (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Apr 2009 00:43:48 -0400
In-Reply-To: <20090402131211.32420d4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>

Hi David, Trond,

The vfs patch has now gone into Linus' tree ...

On Thu, 2 Apr 2009 13:12:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> fs/cachefiles/cf-daemon.c: In function 'cachefiles_daemon_cull':
> fs/cachefiles/cf-daemon.c:576: error: dereferencing pointer to incomplete type
> fs/cachefiles/cf-daemon.c:577: error: dereferencing pointer to incomplete type
> fs/cachefiles/cf-daemon.c:578: error: dereferencing pointer to incomplete type
> fs/cachefiles/cf-daemon.c: In function 'cachefiles_daemon_inuse':
> fs/cachefiles/cf-daemon.c:652: error: dereferencing pointer to incomplete type
> fs/cachefiles/cf-daemon.c:653: error: dereferencing pointer to incomplete type
> fs/cachefiles/cf-daemon.c:654: error: dereferencing pointer to incomplete type
> 
> Caused by commit 96a16ef5cd64d79f9706b9dccdb180d248c46866 ("CacheFiles: A
> cache that backs onto a mounted filesystem") (from the nfs tree)
> interacting with commit 5ad4e53bd5406ee214ddc5a41f03f779b8b2d526 ("Get
> rid of indirect include of fs_struct.h") (from the vfs tree).
> 
> I applied the following merge fixup patch.
> 
> David, Trond, this should be applicable to the nfs tree already.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Apr 2009 13:06:20 +1100
> Subject: [PATCH] nfs: fixup for fallout from cleaning up includes of fs_struct.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/cachefiles/cf-daemon.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/cachefiles/cf-daemon.c b/fs/cachefiles/cf-daemon.c
> index 6aa6e65..b285632 100644
> --- a/fs/cachefiles/cf-daemon.c
> +++ b/fs/cachefiles/cf-daemon.c
> @@ -21,6 +21,7 @@
>  #include <linux/mount.h>
>  #include <linux/statfs.h>
>  #include <linux/ctype.h>
> +#include <linux/fs_struct.h>
>  #include "cf-internal.h"
>  
>  static int cachefiles_daemon_open(struct inode *, struct file *);
> -- 
> 1.6.2.1
> 


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
