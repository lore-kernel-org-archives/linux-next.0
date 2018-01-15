From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 15 (drivers/usb/mtu3/)
Date: Mon, 15 Jan 2018 11:34:15 -0800
Message-ID: <5cf71ed6-c4ad-91a2-8f8a-cb044f9a9f90@infradead.org>
References: <20180115164418.1661a9ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43092 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750732AbeAOTeU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jan 2018 14:34:20 -0500
In-Reply-To: <20180115164418.1661a9ec@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>

On 01/14/2018 09:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180112:
> 

on i386:

../drivers/usb/mtu3/mtu3_plat.c: In function 'mtu3_suspend':
../drivers/usb/mtu3/mtu3_plat.c:462:2: error: implicit declaration of function 'ssusb_wakeup_set' [-Werror=implicit-function-declaration]
  ssusb_wakeup_set(ssusb, true);
  ^

when:
CONFIG_USB_MTU3=y
# CONFIG_USB_MTU3_HOST is not set
CONFIG_USB_MTU3_GADGET=y
# CONFIG_USB_MTU3_DUAL_ROLE is not set
# CONFIG_USB_MTU3_DEBUG is not set


-- 
~Randy
