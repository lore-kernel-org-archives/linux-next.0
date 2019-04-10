From: Alexandru Ardelean <ardeleanalex@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 10 Apr 2019 09:34:29 +0300
Message-ID: <CA+U=Dsrum6cop7OJrwP6EiEggkkBhfigy4oB8Fw1KREyHcjHZw@mail.gmail.com>
References: <20190408130212.0a41f2a8@canb.auug.org.au> <20190408091458.00004e48@huawei.com>
 <20190408100121.GH9224@smile.fi.intel.com> <20190408111439.000049bc@huawei.com>
 <20190408103437.GK9224@smile.fi.intel.com> <20190408130151.0000278a@huawei.com>
 <20190409153942.GW9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409153942.GW9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 9, 2019 at 6:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 08, 2019 at 01:01:51PM +0100, Jonathan Cameron wrote:
> > On Mon, 8 Apr 2019 13:34:37 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Apr 08, 2019 at 11:14:39AM +0100, Jonathan Cameron wrote:
> > > > On Mon, 8 Apr 2019 13:01:21 +0300
> > > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Mon, Apr 08, 2019 at 09:14:58AM +0100, Jonathan Cameron wrote:
> > > > > > On Mon, 8 Apr 2019 13:02:12 +1000
> > > > > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > > > > > That is the correct resolution.
> > > > >
> > > > > I think it still misses the following fix:
> > >
> > > > Is that actually a problem given it's copied over from buffer->scan_mask just after allocation?
> > > > The two masks are the same length so I don't think we have a problem with this one.
> > > > Am I missing something?
> > >
> > > Hmm... I didn't get why the commit 20ea39ef9f2f fixes anything.
> > >
> > Good point.  I'm don't think it ever did.
> >
> > Alex, any thoughts?
>

Hey,

This seems to have been in the context of our tree.
We have this patch:
https://github.com/analogdevicesinc/linux/commit/81d00795b1537

That removes bitmap_copy() .
See here:
https://github.com/analogdevicesinc/linux/commit/81d00795b1537#diff-0a87744ce945d2c1c89ea19f21fb35bbL397

This change is not upstreamed yet.
I guess I am slowly going nuts with trying to sync multiple trees [
our master, upstream IIO & some internal temp-branches ].

To give a bit of background: we've noticed this weird behavior while
testing a AD7193 chip with the AD7192 driver and some weird things
were happening.
At the time, this patch seemed easy to send upstream, so I sent it.

Sorry for the noise.

I guess the conclusion is, that in the context of the mainline IIO
tree, commit 20ea39ef9f2f is not needed.

Thanks
Alex

> I have a thought that it might be possible that somewhere code is still broken,
> i.e. accessing bitmap behind the size (for example, iterating by unsigned long
> without bitmap size being aligned to size of unsigned long).
>
> If this is a case, the mentioned patch has a symptomatic healing and not fixing
> a root cause.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
