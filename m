From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the usb tree with the uuid tree
Date: Thu, 29 Jun 2017 17:59:13 +0300
Message-ID: <1498748353.22624.231.camel@linux.intel.com>
References: <20170629144844.3214d21e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:46656 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753393AbdF2O7R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jun 2017 10:59:17 -0400
In-Reply-To: <20170629144844.3214d21e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Thu, 2017-06-29 at 14:48 +1000, Stephen Rothwell wrote:

> I got the following error:
> 
> drivers/usb/typec/ucsi/ucsi_acpi.c: In function 'ucsi_acpi_dsm':
> drivers/usb/typec/ucsi/ucsi_acpi.c:33:48: error: passing argument 2 of
> 'acpi_evaluate_dsm' from incompatible pointer type [-
> Werror=incompatible-pointer-types]
>   obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), ua->uuid.b, 1, func,
>                                                 ^
> In file included from include/linux/acpi.h:44:0,
>                  from drivers/usb/typec/ucsi/ucsi_acpi.c:14:
> include/acpi/acpi_bus.h:65:20: note: expected 'const guid_t * {aka
> const struct <anonymous> *}' but argument is of type '__u8 * {aka
> unsigned char *}'
>  union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t
> *guid,  
>                     ^
> 
> I have applied the following merge fix patch (the first hunk is
> probably not strictly necessary):

It is necessary. The goal of next portion of the UUID related stuff is
to get rid of those _le / _be types completely (uuid_be gone I suppose
already).

Patch itself looks good to me.

> -	uuid_le uuid;
> +	guid_t uuid;
>  };
>  
>  static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
>  {
>  	union acpi_object *obj;
>  
> -	obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), ua->uuid.b, 1,
> func,

> +	obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), &ua->uuid, 1,
> func,
>  				NULL);

Can it be one line after all?

>  	if (!obj) {
>  		dev_err(ua->dev, "%s: failed to evaluate _DSM %d\n",

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
