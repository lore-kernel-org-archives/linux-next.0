From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 19 (usb/dwc2)
Date: Thu, 19 Mar 2015 10:23:37 -0700
Message-ID: <550B0619.8070909@infradead.org>
References: <20150319182850.3e05e8a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150319182850.3e05e8a5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, John Youn <johnyoun@synopsys.com>
List-Id: linux-next.vger.kernel.org

On 03/19/15 00:28, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150318:
> 

on i386:

drivers/built-in.o: In function `dwc2_pci_remove':
pci.c:(.text+0x37ecf1): undefined reference to `usb_phy_generic_unregister'
drivers/built-in.o: In function `dwc2_pci_probe':
pci.c:(.text+0x37ee8d): undefined reference to `usb_phy_generic_register'
pci.c:(.text+0x37ef63): undefined reference to `usb_phy_generic_unregister'

when CONFIG_NOP_USB_XCEIV=m
and CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y
CONFIG_USB_DWC2_PLATFORM=y
CONFIG_USB_DWC2_PCI=y


Maybe USB_DWC2_PCI should depend on NOP_USB_XCEIV?

-- 
~Randy
