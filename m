From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 8 Apr 2019 09:14:58 +0100
Message-ID: <20190408091458.00004e48@huawei.com>
References: <20190408130212.0a41f2a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408130212.0a41f2a8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org

On Mon, 8 Apr 2019 13:02:12 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/industrialio-buffer.c
> 
> between commit:
> 
>   20ea39ef9f2f ("iio: Fix scan mask selection")
> 
> from the staging.current tree and commit:
> 
>   3862828a903d ("iio: buffer: Switch to bitmap_zalloc()")
> 
> from the staging tree.
> 
> I fixed it up (I just used the staging tree version) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
Thanks Stephen,

That is the correct resolution.

Jonathan
