From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Thu, 14 Mar 2013 13:33:53 -0700
Message-ID: <20130314203353.GA16897@kroah.com>
References: <20130313163935.ea2f414d3ccc6ed1434d92b8@canb.auug.org.au>
 <A2CA0424C0A6F04399FB9E1CD98E030458D8ED91@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E030458D8ED91@US01WEMBX2.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 14, 2013 at 08:23:39PM +0000, Paul Zimmerman wrote:
> > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > Sent: Tuesday, March 12, 2013 10:40 PM
> > 
> > After merging the final tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > drivers/staging/dwc2/hcd.c: In function '_dwc2_hcd_urb_enqueue':
> > drivers/staging/dwc2/hcd.c:2387:3: error: implicit declaration of function 'bus_to_virt' [-Werror=implicit-function-declaration]
> > drivers/staging/dwc2/hcd.c:2387:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> > 
> > Caused by commit 7359d482eb4d ("staging: HCD files for the DWC2 driver").
> > 
> > From Documentation/bus-virt-phys-mapping.txt:
> > 
> > "[ NOTE: The virt_to_bus() and bus_to_virt() functions have been
> >         superseded by the functionality provided by the PCI DMA interface
> >         (see Documentation/DMA-API-HOWTO.txt).  They continue
> >         to be documented below for historical purposes, but new code
> >         must not use them. --davidm 00/12/12 ]"
> > 
> > See also Documentation/DMA-API-HOWTO.txt.
> > 
> > I have added this patch for today:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 13 Mar 2013 16:35:50 +1100
> > Subject: [PATCH] staging: the DWC2 driver uses bus_to_virt
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/staging/dwc2/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/dwc2/Kconfig b/drivers/staging/dwc2/Kconfig
> > index 610418a..bc4cdfe 100644
> > --- a/drivers/staging/dwc2/Kconfig
> > +++ b/drivers/staging/dwc2/Kconfig
> > @@ -1,6 +1,7 @@
> >  config USB_DWC2
> >  	tristate "DesignWare USB2 DRD Core Support"
> >  	depends on USB
> > +	depends on VIRT_TO_BUS
> >  	select USB_OTG_UTILS
> >  	help
> >  	  Say Y or M here if your system has a Dual Role HighSpeed
> > --
> 
> Hi Greg,
> 
> Do you apply these sort of patches automatically, or do you need an ack from me?
> In case you do:
> 
> Acked-by: Paul Zimmerman <paulz@synopsys.com>

Thanks, I'll take it, I hadn't gotten to this fix just yet.

greg k-h
