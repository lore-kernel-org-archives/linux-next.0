From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: RE: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 4 Dec 2017 10:00:12 +0000
Message-ID: <53418B0A3A5CEF439F1108674285B0A90157649A@lhreml523-mbs.china.huawei.com>
References: <20171204125045.59e1a704@canb.auug.org.au>
 <20171204090944.GA16936@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171204090944.GA16936@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: 04 December 2017 09:10
> To: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing
> List <linux-kernel@vger.kernel.org>; Xingyu Chen <xingyu.chen@amlogic.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Martin Blumenstingl
> <martin.blumenstingl@googlemail.com>
> Subject: Re: linux-next: manual merge of the staging tree with the
> staging.current tree
> 
> On Mon, Dec 04, 2017 at 12:50:45PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > Today's linux-next merge of the staging tree got a conflict in:
> >
> >   drivers/iio/adc/meson_saradc.c
> >
> > between commit:
> >
> >   d85eed9f5763 ("iio: adc: meson-saradc: initialize the bandgap correctly on
> older SoCs")
> >
> > from the staging.current tree and commit:
> >
> >   930df4d853a8 ("iio: adc: meson-saradc: remove irrelevant clock "sana"")
> >
> > from the staging tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks for the notification, merge looks correct to me, Jonathan?
> 
> greg k-h

Looks right to me. Sorry about that - I should have noticed this one!

Thanks Stephen,

Jonathan
