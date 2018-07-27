From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the powerpc
 tree
Date: Fri, 27 Jul 2018 10:36:19 +0200
Message-ID: <20180727083619.GA17942@kroah.com>
References: <20180727175911.76ed6d44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180727175911.76ed6d44@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Popa <stefan.popa@analog.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Michael Hanselmann <linux-kernel@hansmi.ch>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 27, 2018 at 05:59:11PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   d69ccc00c497 ("MAINTAINERS: Remove the entry for the orphaned ams driver")
> 
> from the powerpc tree and commit:
> 
>   28d1a7ac2a0d ("iio: dac: Add AD5758 support")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

greg k-h
