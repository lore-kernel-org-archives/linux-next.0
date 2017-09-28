From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Date: Thu, 28 Sep 2017 12:34:06 -0500
Message-ID: <489f35d2-6b65-b96e-76e6-7398b066064d@acm.org>
References: <20170928144537.1465e782@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33999 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751339AbdI1ReJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Sep 2017 13:34:09 -0400
In-Reply-To: <20170928144537.1465e782@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Corey Minyard <cminyard@mvista.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09/27/2017 11:45 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> After merging the ipmi tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/char/ipmi/ipmi_si_platform.c:360:1: warning: data definition has no type or storage class
>   MODULE_DEVICE_TABLE(of, of_ipmi_match);
>   ^
> drivers/char/ipmi/ipmi_si_platform.c:360:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
> drivers/char/ipmi/ipmi_si_platform.c:360:1: warning: parameter names (without types) in function declaration
> drivers/char/ipmi/ipmi_si_pci.c:142:1: warning: data definition has no type or storage class
>   MODULE_DEVICE_TABLE(pci, ipmi_pci_devices);
>   ^
> drivers/char/ipmi/ipmi_si_pci.c:142:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
> drivers/char/ipmi/ipmi_si_pci.c:142:1: warning: parameter names (without types) in function declaration
>
> Caused by commits
>
>    a3f3086dd508 ("ipmi_si: Move platform device handling to another file")
>    fb5d20a966cf ("ipmi_si: Move PCI setup to another file
>
> Probably missing include files.
>
> I have added this patch for today:

Hmm, I'm wondering how this got missed.  I compile tested it, of course,
and lots of things compile my master rebase branch that this came from,
but nothing found this.  Oh well.

Thanks for handling this.  I have the fixes in and ready for next time.

-corey

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 Sep 2017 14:40:49 +1000
> Subject: [PATCH] ipmi_si: MODULE_DEVICE_TABLE needs module.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/char/ipmi/ipmi_si_pci.c      | 2 +-
>   drivers/char/ipmi/ipmi_si_platform.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_pci.c b/drivers/char/ipmi/ipmi_si_pci.c
> index ad0b7b6ad250..99771f5cad07 100644
> --- a/drivers/char/ipmi/ipmi_si_pci.c
> +++ b/drivers/char/ipmi/ipmi_si_pci.c
> @@ -3,7 +3,7 @@
>    *
>    * Handling for IPMI devices on the PCI bus.
>    */
> -#include <linux/moduleparam.h>
> +#include <linux/module.h>
>   #include <linux/pci.h>
>   #include "ipmi_si.h"
>   
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index 0e7ff0a4a151..9573f1116450 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -5,7 +5,7 @@
>    * coming from the platform.
>    */
>   #include <linux/types.h>
> -#include <linux/moduleparam.h>
> +#include <linux/module.h>
>   #include <linux/of_device.h>
>   #include <linux/of_platform.h>
>   #include <linux/of_address.h>
