From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 6 Dec 2017 15:50:04 +0100
Message-ID: <20171206145004.GA15868@kroah.com>
References: <20171204125045.59e1a704@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171204125045.59e1a704@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 04, 2017 at 12:50:45PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/adc/meson_saradc.c
> 
> between commit:
> 
>   d85eed9f5763 ("iio: adc: meson-saradc: initialize the bandgap correctly on older SoCs")
> 
> from the staging.current tree and commit:
> 
>   930df4d853a8 ("iio: adc: meson-saradc: remove irrelevant clock "sana"")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This should now be resolved in my staging-next branch.

thanks,

greg k-h
