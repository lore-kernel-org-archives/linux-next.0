From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 8 Apr 2019 13:34:37 +0300
Message-ID: <20190408103437.GK9224@smile.fi.intel.com>
References: <20190408130212.0a41f2a8@canb.auug.org.au>
 <20190408091458.00004e48@huawei.com>
 <20190408100121.GH9224@smile.fi.intel.com>
 <20190408111439.000049bc@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408111439.000049bc@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Apr 08, 2019 at 11:14:39AM +0100, Jonathan Cameron wrote:
> On Mon, 8 Apr 2019 13:01:21 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 08, 2019 at 09:14:58AM +0100, Jonathan Cameron wrote:
> > > On Mon, 8 Apr 2019 13:02:12 +1000
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > > > Today's linux-next merge of the staging tree got a conflict in:
> > > > 
> > > >   drivers/iio/industrialio-buffer.c
> > > > 
> > > > between commit:
> > > > 
> > > >   20ea39ef9f2f ("iio: Fix scan mask selection")
> > > > 
> > > > from the staging.current tree and commit:
> > > > 
> > > >   3862828a903d ("iio: buffer: Switch to bitmap_zalloc()")
> > > > 
> > > > from the staging tree.
> > > > 
> > > > I fixed it up (I just used the staging tree version) and can carry the
> > > > fix as necessary. This is now fixed as far as linux-next is concerned,
> > > > but any non trivial conflicts should be mentioned to your upstream
> > > > maintainer when your tree is submitted for merging.  You may also want
> > > > to consider cooperating with the maintainer of the conflicting tree to
> > > > minimise any particularly complex conflicts.
> > > >   
> > > Thanks Stephen,
> > > 
> > > That is the correct resolution.  
> > 
> > I think it still misses the following fix:

> Is that actually a problem given it's copied over from buffer->scan_mask just after allocation?
> The two masks are the same length so I don't think we have a problem with this one.
> Am I missing something?

Hmm... I didn't get why the commit 20ea39ef9f2f fixes anything.

-- 
With Best Regards,
Andy Shevchenko
