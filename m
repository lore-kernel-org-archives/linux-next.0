From: Ramneek Mehresh <ramneek.mehresh@freescale.com>
Subject: RE: Build errors in -next due to 'drivers:usb:fsl:Make fsl ehci drv
 an independent driver module'
Date: Thu, 28 May 2015 03:55:24 +0000
Message-ID: <SN1PR0301MB1583B121602C0F5C8AD4FCE4E0CA0@SN1PR0301MB1583.namprd03.prod.outlook.com>
References: <20150527195903.GA5716@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150527195903.GA5716@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Thursday, May 28, 2015 1:29 AM
> To: Mehresh Ramneek-B31383
> Cc: Alan Stern; Greg Kroah-Hartman; linux-kernel@vger.kernel.org; linux-
> next@vger.kernel.org
> Subject: Build errors in -next due to 'drivers:usb:fsl:Make fsl ehci drv an
> independent driver module'
> 
> Hi,
> 
> your patch 'drivers:usb:fsl:Make fsl ehci drv an independent driver module'
> converts the driver into a separate module. Unfortunately, it uses non-
> exported functions from the ehci core code. This results in compile errors for
> several powerpc configurations.
> 
> drivers/usb/host/ehci-fsl.c: In function 'ehci_fsl_drv_suspend':
> drivers/usb/host/ehci-fsl.c:531:2: error: implicit declaration of function
> 'ehci_adjust_port_wakeup_flags'
> drivers/usb/host/ehci-fsl.c: In function 'ehci_fsl_drv_resume':
> drivers/usb/host/ehci-fsl.c:561:2: error: implicit declaration of function
> 'ehci_reset'
>
Understood...apologies for the inconvenience caused. This problem comes when both 
ehci_hcd and ehci_fsl are built as modules. Till now, only ehci-hcd was build as 
module, and other drivers were built into it. I tested ehci_fsl as a module with ehci_hcd as build-in.

Now, there are two solutions for this.
1. export each function in ehci_hcd.c
2. I make ehci-fsl.c as built-in

Please suggest.
 
> Guenter
