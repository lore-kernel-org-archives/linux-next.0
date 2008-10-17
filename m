From: Ian Kent <raven@themaw.net>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 17 Oct 2008 19:26:34 +0800 (WST)
Message-ID: <alpine.LFD.2.00.0810171925220.10714@raven.themaw.net>
References: <20081017172546.ee699528.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:34675 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754442AbYJQL0o (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 07:26:44 -0400
In-Reply-To: <20081017172546.ee699528.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, 17 Oct 2008, Stephen Rothwell wrote:

> Hi David,
> 
> Today's linux-next build (powerpc_ppc64_defconfig) failed like this:
> 
> fs/autofs4/dev-ioctl.c: In function 'autofs_dev_ioctl_open_mountpoint':
> fs/autofs4/dev-ioctl.c:310: error: too few arguments to function 'dentry_open'
> 
> Commit 8d7b48e0bc5fa01a818eac713d4cb0763090cd0e ("autofs4: add
> miscellaneous device for ioctls") added this file and interacts with
> commit 327a669334991cb9d42e7eddf771fd760721fbf8 ("CRED: Pass credentials
> through dentry_open()") from the creds tree.
> 
> I applied the following patch (which may not be correct).
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 17 Oct 2008 17:23:07 +1100
> Subject: [PATCH] creds: autofs4 needs updating for dentry_open change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/autofs4/dev-ioctl.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/autofs4/dev-ioctl.c b/fs/autofs4/dev-ioctl.c
> index 625abf5..3c299be 100644
> --- a/fs/autofs4/dev-ioctl.c
> +++ b/fs/autofs4/dev-ioctl.c
> @@ -288,6 +288,7 @@ static int autofs_dev_ioctl_open_mountpoint(const char *path, dev_t devid)
>  	struct file *filp;
>  	struct nameidata nd;
>  	int err, fd;
> +	const struct cred *cred = current_cred();
>  
>  	fd = get_unused_fd();
>  	if (likely(fd >= 0)) {
> @@ -307,7 +308,8 @@ static int autofs_dev_ioctl_open_mountpoint(const char *path, dev_t devid)
>  			goto out;
>  		}
>  
> -		filp = dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY);
> +		filp = dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY,
> +			cred);

btw, I believe that in Andrews tree a NULL has been added to dentry_open.

>  		if (IS_ERR(filp)) {
>  			err = PTR_ERR(filp);
>  			goto out;
> -- 
> 1.5.6.5
> 
> 
