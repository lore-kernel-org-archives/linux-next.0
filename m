From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Wed, 6 Jun 2018 11:47:32 +0200
Message-ID: <20180606094732.GA30903@kroah.com>
References: <20180606191205.27b1290c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180606191205.27b1290c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 06, 2018 at 07:12:05PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/ipx/af_ipx.c
>   drivers/staging/ipx/ipx_proc.c
> 
> between commits:
> 
>   fddda2b7b521 ("proc: introduce proc_create_seq{,_data}")
>   db5051ead64a ("net: convert datagram_poll users tp ->poll_mask")
> 
> from Linus' tree and commit:
> 
>   7a2e838d28cf ("staging: ipx: delete it from the tree")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks, those files should just be removed.

greg k-h
