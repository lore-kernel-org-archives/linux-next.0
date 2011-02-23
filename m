From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Fix build failure when CONFIG_NLS is set to 'm' by
	allmodconfig
Date: Wed, 23 Feb 2011 13:17:34 +0000
Message-ID: <20110223131734.GA6275@srcf.ucam.org>
References: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35732 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754335Ab1BWNR5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Feb 2011 08:17:57 -0500
Content-Disposition: inline
In-Reply-To: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Narendra_K@Dell.com
Cc: viro@zeniv.linux.org.uk, jbarnes@virtuousgeek.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Shyam_Iyer@Dell.com, Matt_Domsch@Dell.com, Charles_Rose@Dell.com, Jordan_Hargrave@Dell.com

On Wed, Feb 23, 2011 at 06:24:31PM +0530, Narendra_K@Dell.com wrote:

> This patch fixes the following build breakage introduced by the patch
> '[PATCH V3] Export ACPI _DSM provided firmware instance number and string to
> sysfs'.

First, you should include this as part of your original patch so that 
the build doesn't break during bisection.

> This is fixed by making fs/nls/nls_base.c compile conditionally into
> vmlinux by introducing a new config option CONFIG_NLS_BASE which is
> selected by (ACPI || DMI || NLS).

Why?

> -obj-$(CONFIG_NLS)		+= nls/
> +obj-y				+= nls/

You seem to have just broken building any of the NLS code as modules.

>  menuconfig NLS
>  	tristate "Native language support"
> +	select NLS_BASE

All CONFIG_NLS does is build nls_base.

> +config NLS_BASE
> +	bool "Base NLS functions"
> +	depends on ACPI || DMI

What in this code depends on ACPI or DMI?

> -obj-$(CONFIG_NLS)		+= nls_base.o
> +obj-$(CONFIG_NLS_BASE)		+= nls_base.o

And why make this change?

Just have something like

select NLS if (ACPI || DMI)

in drivers/pci/Kconfig.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
