From: "Lan, Tianyu" <tianyu.lan@intel.com>
Subject: RE: linux-next: build failure after merge of the usb tree
Date: Mon, 28 Jan 2013 16:03:07 +0000
Message-ID: <4CFBC02C07DA244CA19D6815A05BE6EE1BB7F5@SHSMSX101.ccr.corp.intel.com>
References: <20130128214644.a3906eecaf9123b05216dcaf@canb.auug.org.au>
 <20130128144508.GA2997@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:20516 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754174Ab3A1QDL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jan 2013 11:03:11 -0500
In-Reply-To: <20130128144508.GA2997@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

I just check the commit 88bb965ed711 can not git revert smoothly. I will do it
and send a revert patch.

Best Regards 
Tianyu Lan 


-----Original Message-----
From: Greg KH [mailto:gregkh@linuxfoundation.org] 
Sent: Monday, January 28, 2013 10:45 PM
To: Stephen Rothwell
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Lan, Tianyu
Subject: Re: linux-next: build failure after merge of the usb tree

On Mon, Jan 28, 2013 at 09:46:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 
> allmodconfig) failed like this:
> 
> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_register_power_resources':
> drivers/usb/core/usb-acpi.c:226:2: error: implicit declaration of 
> function 'acpi_power_resource_register_device' 
> [-Werror=implicit-function-declaration]
> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_unregister_power_resources':
> drivers/usb/core/usb-acpi.c:234:3: error: implicit declaration of 
> function 'acpi_power_resource_unregister_device' 
> [-Werror=implicit-function-declaration]
> 
> Caused by commit 88bb965ed711 ("usb: Register usb port's acpi power 
> resources").
> 
> I have used the usb tree from next-20130125 for today.

Lan, please send me a patch to resolve this issue.

Stephen, sorry for the breakage.

thanks,

greg k-h
