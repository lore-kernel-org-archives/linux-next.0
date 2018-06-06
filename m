From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Wed, 6 Jun 2018 11:10:47 +0200
Message-ID: <20180606091046.GA28264@kroah.com>
References: <20180606190858.7d4c27ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180606190858.7d4c27ac@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 06, 2018 at 07:08:58PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/ncpfs/dir.c
> 
> between commit:
> 
>   1c5fedbb508f ("ncp_lookup(): use d_splice_alias()")
> 
> from Linus' tree and commit:
> 
>   bd32895c750b ("staging: ncpfs: delete it")
> 
> from the staging tree.
> 
> I fixed it up (the latter removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks, I figured this would show up, not a problem, the file should be
just removed.

greg k-h
