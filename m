From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Mon, 28 Jan 2013 06:45:08 -0800
Message-ID: <20130128144508.GA2997@kroah.com>
References: <20130128214644.a3906eecaf9123b05216dcaf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:58680 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756969Ab3A1Onb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jan 2013 09:43:31 -0500
Content-Disposition: inline
In-Reply-To: <20130128214644.a3906eecaf9123b05216dcaf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lan Tianyu <tianyu.lan@intel.com>

On Mon, Jan 28, 2013 at 09:46:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_register_power_resources':
> drivers/usb/core/usb-acpi.c:226:2: error: implicit declaration of function 'acpi_power_resource_register_device' [-Werror=implicit-function-declaration]
> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_unregister_power_resources':
> drivers/usb/core/usb-acpi.c:234:3: error: implicit declaration of function 'acpi_power_resource_unregister_device' [-Werror=implicit-function-declaration]
> 
> Caused by commit 88bb965ed711 ("usb: Register usb port's acpi power
> resources").
> 
> I have used the usb tree from next-20130125 for today.

Lan, please send me a patch to resolve this issue.

Stephen, sorry for the breakage.

thanks,

greg k-h
