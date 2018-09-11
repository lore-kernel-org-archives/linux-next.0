From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 11 Sep 2018 09:43:46 +0100
Message-ID: <20180911084346.GB4185@dell>
References: <20180911125857.5e5c34f4@canb.auug.org.au>
 <20180911082534.GA4185@dell>
 <84bafe76-741e-7dc1-d985-62027f4f634a@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <84bafe76-741e-7dc1-d985-62027f4f634a@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Radu Pirea <radu.pirea@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 11 Sep 2018, Nicolas Ferre wrote:

> On 11/09/2018 at 10:25, Lee Jones wrote:
> > On Tue, 11 Sep 2018, Stephen Rothwell wrote:
> > 
> > > Hi Greg,
> > > 
> > > After merging the tty tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > drivers/mfd/at91-usart.c:51:34: error: array type has incomplete element type 'struct of_device_id'
> > >   static const struct of_device_id at91_usart_mode_of_match[] = {
> > >                                    ^~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/mfd/at91-usart.c:52:4: error: field name not in record or union initializer
> > >    { .compatible = "atmel,at91rm9200-usart" },
> > >      ^
> > > drivers/mfd/at91-usart.c:52:4: note: (near initialization for 'at91_usart_mode_of_match')
> > > drivers/mfd/at91-usart.c:53:4: error: field name not in record or union initializer
> > >    { .compatible = "atmel,at91sam9260-usart" },
> > >      ^
> > > drivers/mfd/at91-usart.c:53:4: note: (near initialization for 'at91_usart_mode_of_match')
> > > drivers/mfd/at91-usart.c:51:34: warning: 'at91_usart_mode_of_match' defined but not used [-Wunused-variable]
> > >   static const struct of_device_id at91_usart_mode_of_match[] = {
> > >                                    ^~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >    7d3aa342cef7 ("mfd: at91-usart: Add MFD driver for USART")
> > > 
> > > Forgot to include <linux/mod_devicetable.h>?
> > 
> > Looks like a missing Device Tree header <linux/of.h>.
> > 
> > Will chase this today and follow up with another PR.
> 
> Hi all,
> 
> Actually it is due to the missing of  <linux/mod_devicetable.h> as Stephen
> suggested. It is due to the patch ac3167257b9f ("headers: separate
> linux/mod_devicetable.h from linux/platform_device.h") merged in v4.19-rc1.

Since this set uses Device Tree, it really should include the of.h.

This solves the issue reported above.

I will fix-up and re-send the pull-request.

> because linux/platform_device.h was included by linux/mfd/core.h that is
> present in this driver. This is why the issue was not identified beforehand.
> 
> I'm building a tiny patch to address this right now.
> 
> Thanks for your help. Best regards,

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
