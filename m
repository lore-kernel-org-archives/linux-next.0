From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] staging/comedi: fixing ni_labpc to mite dependancy
Date: Thu, 03 Jun 2010 09:21:53 -0700
Message-ID: <4C07D6A1.1080906@oracle.com>
References: <20100602151439.6de66132.sfr@canb.auug.org.au> <20100602100735.0812c063.randy.dunlap@oracle.com> <alpine.DEB.1.10.1006031545010.23736@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:28264 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754329Ab0FCQYV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2010 12:24:21 -0400
In-Reply-To: <alpine.DEB.1.10.1006031545010.23736@blala.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Kurz <linux@blala.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Kurz <linux@kbdbabel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On 06/03/10 04:50, Alexander Kurz wrote:
> Hi,
>  the dependancy of ni_labpc on mite was missing,
>  it will be fixed with this patch
>  thanks for the report,
>  Alexander
> 
> From d310498ef2a61057c3f28b10bb417238f33e8265 Mon Sep 17 00:00:00 2001
> From: Alexander Kurz <linux@kbdbabel.org>
> Date: Thu, 3 Jun 2010 12:00:37 +0200
> Subject: [PATCH] staging/comedi: fixing ni_labpc to mite dependancy
> 
> Signed-off-by: Alexander Kurz <linux@kbdbabel.org>
> ---
>  drivers/staging/comedi/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/staging/comedi/Kconfig b/drivers/staging/comedi/Kconfig
> index 0aa2b0d..79f5f2e 100644
> --- a/drivers/staging/comedi/Kconfig
> +++ b/drivers/staging/comedi/Kconfig
> @@ -1272,6 +1272,7 @@ config COMEDI_NI_TIO
>  
>  config COMEDI_NI_LABPC
>  	tristate "NI Lab-PC and compatibles ISA and PCI support"
> +	depends on COMEDI_MITE
>  	select COMEDI_8255
>  	select COMEDI_FC
>  	default N

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

thanks.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
