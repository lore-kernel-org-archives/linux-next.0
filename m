From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 11 Sep 2018 10:23:24 +0200
Message-ID: <20180911082324.GC17267@kroah.com>
References: <20180911125857.5e5c34f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911125857.5e5c34f4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Radu Pirea <radu.pirea@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 11, 2018 at 12:58:57PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/mfd/at91-usart.c:51:34: error: array type has incomplete element type 'struct of_device_id'
>  static const struct of_device_id at91_usart_mode_of_match[] = {
>                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/at91-usart.c:52:4: error: field name not in record or union initializer
>   { .compatible = "atmel,at91rm9200-usart" },
>     ^
> drivers/mfd/at91-usart.c:52:4: note: (near initialization for 'at91_usart_mode_of_match')
> drivers/mfd/at91-usart.c:53:4: error: field name not in record or union initializer
>   { .compatible = "atmel,at91sam9260-usart" },
>     ^
> drivers/mfd/at91-usart.c:53:4: note: (near initialization for 'at91_usart_mode_of_match')
> drivers/mfd/at91-usart.c:51:34: warning: 'at91_usart_mode_of_match' defined but not used [-Wunused-variable]
>  static const struct of_device_id at91_usart_mode_of_match[] = {
>                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   7d3aa342cef7 ("mfd: at91-usart: Add MFD driver for USART")
> 
> Forgot to include <linux/mod_devicetable.h>?
> 
> I used the version of the tty tree from next-20180910 for today.

Very odd, I just pulled in the "Immutable" branch from Lee here.

Lee, is there something I am missing to get this to build properly?

thanks,

greg k-h
