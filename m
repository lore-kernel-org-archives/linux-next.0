From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the uuid tree
Date: Thu, 08 Jun 2017 14:30:43 +0300
Message-ID: <1496921443.22624.53.camel@linux.intel.com>
References: <20170608160415.007d1800@canb.auug.org.au>
         <20170608070414.GA12961@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:48298 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750914AbdFHLas (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Jun 2017 07:30:48 -0400
In-Reply-To: <20170608070414.GA12961@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 2017-06-08 at 09:04 +0200, Christoph Hellwig wrote:
> On Thu, Jun 08, 2017 at 04:04:15PM +1000, Stephen Rothwell wrote:
> > Hi Christoph,
> > 
> > After merging the uuid tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > In file included from drivers/base/cpu.c:16:0:
> > include/linux/acpi.h:744:16: error: unknown type name 'guid_t'
> >           const guid_t *guid,
> >                 ^
> > 
> > Caused by commit
> > 
> >   94116f8126de ("ACPI: Switch to use generic guid_t in
> > acpi_evaluate_dsm()")
> > 
> > linux/uuid.h is only include for the CONFIG_ACPI case (in commit
> > 41c8bdb3ab10 "acpi, nfit: Switch to use new generic UUID
> > API").  This
> > build does not have CONFIG_ACPI set.
> 
> Meh.  Fix below:

Oh, indeed.
Thanks for taking care!

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> ---
> From bcbc2265f269cc57924371e3bce8c3220d0270c5 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Thu, 8 Jun 2017 09:02:20 +0200
> Subject: acpi: always include uuid.h
> 
> Without this the build will fail for !CONFIG_ACPI builds on x86.
> 
> Fixes: 94116f81 ("ACPI: Switch to use generic guid_t in
> acpi_evaluate_dsm()")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/acpi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index ab19365c905f..cafdfb84ca28 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -26,6 +26,7 @@
>  #include <linux/resource_ext.h>
>  #include <linux/device.h>
>  #include <linux/property.h>
> +#include <linux/uuid.h>
>  
>  #ifndef _LINUX
>  #define _LINUX
> @@ -39,7 +40,6 @@
>  #include <linux/dynamic_debug.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/uuid.h>
>  
>  #include <acpi/acpi_bus.h>
>  #include <acpi/acpi_drivers.h>

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
