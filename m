From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH] dma: vdma: Fix compilation warnings
Date: Mon, 30 Mar 2015 13:18:28 +0000
Message-ID: <BY2FFO11FD054AD90102C832165B542ABA1F50@BY2FFO11FD054.protection.gbl>
References: <3912f868-18f8-44ef-9312-b3842270b4da@BY2FFO11OLC001.protection.gbl>
	<20150330203624.51cd07d5@canb.auug.org.au>
	<BL2FFO11FD0547729E39ACFCB0A988C88A1F50@BL2FFO11FD054.protection.gbl>
 <20150331001050.37edbd32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150331001050.37edbd32@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anirudha Sarangi <anirudh@xilinx.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, March 30, 2015 6:41 PM
> To: Appana Durga Kedareswara Rao
> Cc: vinod.koul@intel.com; linux-next@vger.kernel.org; linux-
> kernel@vger.kernel.org; Anirudha Sarangi
> Subject: Re: [PATCH] dma: vdma: Fix compilation warnings
>
> Hi Appana,
>
> On Mon, 30 Mar 2015 11:40:02 +0000 Appana Durga Kedareswara Rao
> <appana.durga.rao@xilinx.com> wrote:
> >
> > > -----Original Message-----
> > > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > > Sent: Monday, March 30, 2015 3:06 PM
> > > To: Appana Durga Kedareswara Rao
> > > Cc: vinod.koul@intel.com; linux-next@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; Anirudha Sarangi; Appana Durga Kedareswara
> > > Rao
> > > Subject: Re: [PATCH] dma: vdma: Fix compilation warnings
> > >
> > > Hi Kedareswara,
> > >
> > > On Mon, 30 Mar 2015 14:30:26 +0530 Kedareswara rao Appana
> > > <appana.durga.rao@xilinx.com> wrote:
> > > >
> > > > diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
> > > > index 022e34f..01c91bb 100644
> > > > --- a/include/linux/dmapool.h
> > > > +++ b/include/linux/dmapool.h
> > > > @@ -13,6 +13,7 @@
> > > >
> > > >  #include <asm/io.h>
> > > >  #include <asm/scatterlist.h>
> > > > +#include <linux/device.h>
> > > >
> > > >  struct dma_pool *dma_pool_create(const char *name, struct device
> *dev,
> > > >                     size_t size, size_t align, size_t allocation);
> > >
> > > This might be to much, all it really needs is a
> > >
> > > struct device;
> > >
> > > line ...
> >
> > Why it is a better solution rather than including header file?
> > I didn't get you could you please explain a bit.
>
> When adding an include to an include file, there is always the chance that you
> may create a circular include and break some other unrelated code.  In this
> case the far more unintrusive fix is to just add the forward declaration of the
> struct to satisfy the compiler as the actual definition of the struct is not
> needed (since only pointers to the struct are referenced in dmapool.h).
>

Ok got it thanks for the clarification.

Will send a v2 with the change that you suggested.

Regards,
Kedar.

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
