From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 1 May 2013 09:13:41 -0400
Message-ID: <20130501131341.GC32031@fieldses.org>
References: <20130501122227.4c1d5cd6f2f2f98e35706f44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([174.143.236.118]:59403 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356Ab3EANNq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 May 2013 09:13:46 -0400
Content-Disposition: inline
In-Reply-To: <20130501122227.4c1d5cd6f2f2f98e35706f44@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simo Sorce <simo@redhat.com>, David Howells <dhowells@redhat.com>

On Wed, May 01, 2013 at 12:22:27PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> net/sunrpc/auth_gss/svcauth_gss.c: In function 'write_gssp':
> net/sunrpc/auth_gss/svcauth_gss.c:1329:9: error: implicit declaration of function 'PDE' [-Werror=implicit-function-declaration]
> net/sunrpc/auth_gss/svcauth_gss.c:1329:53: error: invalid type argument of '->' (have 'int')
> net/sunrpc/auth_gss/svcauth_gss.c: In function 'read_gssp':
> net/sunrpc/auth_gss/svcauth_gss.c:1357:53: error: invalid type argument of '->' (have 'int')
> 
> Caused by commit 030d794bf498 ("SUNRPC: Use gssproxy upcall for server
> RPCGSS authentication") from the nfsd tree interacting with commit
> c3f2cb25be4f ("proc: Make the PROC_I() and PDE() macros internal to
> procfs") from the vfs tree.
> 
> I applied the following merge fix patch (there may be a better way).

Looks fine to me, thanks!

--b.

> 
> From 62a0e3a08844eeeb6d85fb45d85c2f80d7de2797 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 1 May 2013 12:19:43 +1000
> Subject: [PATCH] SUNRPC: update for PDE removal
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/sunrpc/auth_gss/svcauth_gss.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/sunrpc/auth_gss/svcauth_gss.c b/net/sunrpc/auth_gss/svcauth_gss.c
> index b70ac1c..89ef709 100644
> --- a/net/sunrpc/auth_gss/svcauth_gss.c
> +++ b/net/sunrpc/auth_gss/svcauth_gss.c
> @@ -1326,7 +1326,7 @@ static int wait_for_gss_proxy(struct net *net)
>  static ssize_t write_gssp(struct file *file, const char __user *buf,
>  			 size_t count, loff_t *ppos)
>  {
> -	struct net *net = PDE(file->f_path.dentry->d_inode)->data;
> +	struct net *net = PDE_DATA(file->f_path.dentry->d_inode);
>  	char tbuf[20];
>  	unsigned long i;
>  	int res;
> @@ -1354,7 +1354,7 @@ static ssize_t write_gssp(struct file *file, const char __user *buf,
>  static ssize_t read_gssp(struct file *file, char __user *buf,
>  			 size_t count, loff_t *ppos)
>  {
> -	struct net *net = PDE(file->f_path.dentry->d_inode)->data;
> +	struct net *net = PDE_DATA(file->f_path.dentry->d_inode);
>  	unsigned long p = *ppos;
>  	char tbuf[10];
>  	size_t len;
> -- 
> 1.8.1
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
