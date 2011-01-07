From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the fbdev
 tree
Date: Fri, 7 Jan 2011 14:39:42 -0800
Message-ID: <20110107223942.GA19793@kroah.com>
References: <20110107133511.bcfc1e85.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110107133511.bcfc1e85.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 07, 2011 at 01:35:11PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/video/udlfb.c between commit realloc_framebuffer ("video: udlfb:
> Kill off special printk wrappers, use pr_fmt()") from the fbdev tree and
> commit 5b84cc781058bb452f869d84bb24442ec51948c4 ("staging: Use vzalloc")
> from the staging tree.
> 
> Another commit in the fbdev tree moves this file out of staging (from
> drivers/staging/udlfb/udlfb.c).
> 
> I fixed it up (see below) and can carry the fix as necessary.

Patch looks good to me, thanks for doing this.

greg k-h
