From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the trivial
 tree
Date: Sun, 17 Jul 2011 11:16:10 +0200
Message-ID: <20110717091610.GE25824@kroah.com>
References: <20110716225643.426f99dafa7fcebab4cd9be8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110716225643.426f99dafa7fcebab4cd9be8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaliy Ivanov <vitalivanov@gmail.com>, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

On Sat, Jul 16, 2011 at 10:56:43PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/westbridge/astoria/arch/arm/plat-omap/include/mach/westbridge/westbridge-omap3-pnand-hal/cyashalomap_kernel.h
> drivers/staging/westbridge/astoria/gadget/cyasgadget.h between commit
> e44ba033c565 ("treewide: remove duplicate includes") from the trivial
> tree and commit 78f23926dff9 ("Staging: delete westbridge code") from the
> staging tree.
> 
> The latter removes the files, so I did that.

Thanks, that is correct.
