From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (usb-gadget tree related)
Date: Tue, 13 Aug 2013 21:52:53 +0200
Message-ID: <CA+icZUUse7BHLQWZYAq1znr8XbiiFyxrCN1YxiR+z=cUH+D6jQ@mail.gmail.com>
References: <20130813181719.e2dea691c1e3c19bd6306983@canb.auug.org.au>
	<20130813194803.GA11075@radagast>
	<20130813195133.GC11075@radagast>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:49538 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757862Ab3HMTwy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2013 15:52:54 -0400
In-Reply-To: <20130813195133.GC11075@radagast>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: balbi@ti.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

On Tue, Aug 13, 2013 at 9:51 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Tue, Aug 13, 2013 at 02:48:03PM -0500, Felipe Balbi wrote:
>> Hi,
>>
>> On Tue, Aug 13, 2013 at 06:17:19PM +1000, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > After merging the final tree, today's linux-next build (powerpc allyesconfig)
>> > failed like this:
>> >
>> > drivers/usb/phy/phy-am335x-control.c: In function 'am335x_control_usb_probe':
>> > drivers/usb/phy/phy-am335x-control.c:117:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
>> >   if (IS_ERR(ctrl_usb->phy_reg))
>> >   ^
>> > drivers/usb/phy/phy-am335x-control.c:118:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
>> >    return PTR_ERR(ctrl_usb->phy_reg);
>> >    ^
>> >
>> > Caused by commit 3bb869c8b3f1 ("usb: phy: Add AM335x PHY driver") from
>> > the usb-gadget tree.  Forgot to include linux/err.h.
>> >
>> > I have reverted that commit for today.
>>
>> damn, I didn't catch that. Sebastian, can you send a patch ?
>
> nevermind already patched it myself.
>

Sebastian sent some hours ago this one:

[PATCH] usb: phy: am335x: include linux/err.h

- Sedat -
