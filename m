From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next
 tree
Date: Thu, 28 Feb 2019 08:04:08 +0100
Message-ID: <20190228070408.GA27446@kroah.com>
References: <20190228155201.329a1fad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228155201.329a1fad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 28, 2019 at 03:52:01PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/fsl-dpaa2/ethsw/ethsw.c
> 
> between commit:
> 
>   570b68c8ddde ("staging: fsl-dpaa2: ethsw: Handle SWITCHDEV_PORT_ATTR_SET")
> 
> from the net-next tree and commit:
> 
>   11f27765f611 ("staging: fsl-dpaa2: ethsw: Add missing netdevice check")
> 
> from the staging tree.
> 
> I fixed it up (the former is a superset of the latter) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Looks good to me, thanks!

greg k-h
