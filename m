From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 2/2] staging/comedi: fixing ni_tio to mite PCI dependancy
Date: Wed, 19 May 2010 14:10:59 -0700
Message-ID: <4BF453E3.2040301@oracle.com>
References: <alpine.DEB.1.10.1005081218220.5727@blala.de> <20100514190142.GA2505@kroah.com> <201005142029.37408.fmhess@speakeasy.net> <20100515034423.GA3811@suse.de> <20100519103203.155c9527.randy.dunlap@oracle.com> <alpine.DEB.1.10.1005200028420.20214@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56307 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787Ab0ESVLr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2010 17:11:47 -0400
In-Reply-To: <alpine.DEB.1.10.1005200028420.20214@blala.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Kurz <linux@blala.de>
Cc: Greg KH <gregkh@suse.de>, linux-next@vger.kernel.org, fmhess@users.sourceforge.net, Greg KH <greg@kroah.com>, Ian Abbott <abbotti@mev.co.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On 05/19/10 13:32, Alexander Kurz wrote:
> On Wed, 19 May 2010, Randy Dunlap wrote:
>> linux-next of 2010-0519:
>> when CONFIG_PCI is not enabled:
>>
>> drivers/staging/comedi/drivers/mite.c: In function 'mite_init':
>> drivers/staging/comedi/drivers/mite.c:89: error: implicit declaration of function 'pci_dev_get'
>> drivers/staging/comedi/drivers/mite.c:89: warning: assignment makes pointer from integer without a cast
>> make[5]: *** [drivers/staging/comedi/drivers/mite.o] Error 1
> 
> thanks, this patch is a follow-up to
>> [PATCH] staging/comedi: fixing 8255 and DAS08 Kconfig dependancies.
> 
> From 9804b6bc8c997433411b24f477417f8e7cc9a19d Mon Sep 17 00:00:00 2001
> From: Alexander Kurz <linux@kbdbabel.org>
> Date: Wed, 19 May 2010 22:23:00 +0200
> Subject: [PATCH 2/2] staging/comedi: fixing ni_tio to mite PCI dependancy
> 
> Signed-off-by: Alexander Kurz <linux@kbdbabel.org>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  drivers/staging/comedi/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/comedi/Kconfig b/drivers/staging/comedi/Kconfig
> index ebc68ee..0aa2b0d 100644
> --- a/drivers/staging/comedi/Kconfig
> +++ b/drivers/staging/comedi/Kconfig
> @@ -1258,8 +1258,8 @@ config COMEDI_MITE
>  
>  config COMEDI_NI_TIO
>  	tristate "NI general purpose counter support"
> +	depends on COMEDI_MITE
>  	select COMEDI_8255
> -	select COMEDI_MITE
>  	default N
>  	---help---
>  	  Enable support for National Instruments general purpose counters.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
