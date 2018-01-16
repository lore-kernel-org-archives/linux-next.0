From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: linux-next: Tree for Jan 15 (drivers/usb/mtu3/)
Date: Tue, 16 Jan 2018 10:13:34 +0800
Message-ID: <1516068814.3717.3.camel@mhfsdcap03>
References: <20180115164418.1661a9ec@canb.auug.org.au>
         <5cf71ed6-c4ad-91a2-8f8a-cb044f9a9f90@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5cf71ed6-c4ad-91a2-8f8a-cb044f9a9f90@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

Arnd had sent a patch to fix this issue,

please refer to : https://patchwork.kernel.org/patch/10155685

thanks

On Mon, 2018-01-15 at 11:34 -0800, Randy Dunlap wrote:
> On 01/14/2018 09:44 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20180112:
> > 
> 
> on i386:
> 
> ../drivers/usb/mtu3/mtu3_plat.c: In function 'mtu3_suspend':
> ../drivers/usb/mtu3/mtu3_plat.c:462:2: error: implicit declaration of function 'ssusb_wakeup_set' [-Werror=implicit-function-declaration]
>   ssusb_wakeup_set(ssusb, true);
>   ^
> 
> when:
> CONFIG_USB_MTU3=y
> # CONFIG_USB_MTU3_HOST is not set
> CONFIG_USB_MTU3_GADGET=y
> # CONFIG_USB_MTU3_DUAL_ROLE is not set
> # CONFIG_USB_MTU3_DEBUG is not set
> 
> 
