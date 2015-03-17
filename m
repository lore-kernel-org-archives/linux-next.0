From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: Build failure: -next 20150316
Date: Tue, 17 Mar 2015 10:41:52 -0700
Message-ID: <55086760.8060305@synopsys.com>
References: <20150316195904.620c48f4@www.etchedpixels.co.uk> <20150317035226.GA29805@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150317035226.GA29805-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 3/16/2015 8:53 PM, Felipe Balbi wrote:
> Hi,
> 
> On Mon, Mar 16, 2015 at 07:59:04PM +0000, Alan Cox wrote:
>> drivers/built-in.o: In function `dwc2_pci_remove':
>> /rotating/Kernel/next/drivers/usb/dwc2/pci.c:70: undefined reference to
>> `usb_phy_generic_unregister' drivers/built-in.o: In function
>> `dwc2_pci_probe': /rotating/Kernel/next/drivers/usb/dwc2/pci.c:118:
>> undefined reference to
>> `usb_phy_generic_register' /rotating/Kernel/next/drivers/usb/dwc2/pci.c:141:
>> undefined reference to `usb_phy_generic_unregister' Makefile:950: recipe
>> for target 'vmlinux' failed make: *** [vmlinux] Error 1
> 
> I think I already a fix for this in my testing/next, just need to mergew
> it into next after testing.
> 
> 

Hi Felipe,

I think it's different problem. I'll have a patch for you
shortly.

John

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
