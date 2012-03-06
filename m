From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Subject: Re: "usb: gadget: pch_udc: Detecting VBUS through GPIO with
 interrupt" breaks sparc
Date: Tue, 6 Mar 2012 09:07:49 +0900
Message-ID: <CANKRQngDUf6TRBmn07-9Cxo+ZheC9hXrp4ZSaDEC=ee0481T7w@mail.gmail.com>
References: <4F51432C.8020204@windriver.com>
	<20120303104142.9615e7a2d9330a5443e0e027@canb.auug.org.au>
	<20120305164308.GE2459@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:59401 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757985Ab2CFAHt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Mar 2012 19:07:49 -0500
Received: by dadp12 with SMTP id p12so5794462dad.11
        for <linux-next@vger.kernel.org>; Mon, 05 Mar 2012 16:07:49 -0800 (PST)
In-Reply-To: <20120305164308.GE2459@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Gortmaker <paul.gortmaker@windriver.com>, Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org

Hi Greg

Sorry, for inconvenience.
I'll re-submit ASAP.

thanks

-- 
ROHM Co., Ltd.
tomoya

2012年3月6日1:43 Greg KH <gregkh@linuxfoundation.org>:
> On Sat, Mar 03, 2012 at 10:41:42AM +1100, Stephen Rothwell wrote:
>> [Just cc'ing Greg as this commit is in the usb tree]
>>
>> On Fri, 2 Mar 2012 17:01:16 -0500 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>> >
>> > This commit:
>> >
>> > ---------------
>> > commit 637b78eb31e0b167ed913f1750bb645dfeda38f0
>> > Author: Tomoya MORINAGA <tomoya.rohm@gmail.com>
>> > Date:   Fri Feb 3 16:14:18 2012 +0900
>> >
>> >     usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt
>> >
>> >     Problem:
>> >      pch_udc continues operation even if VBUS becomes Low.
>> >      pch_udc performs D+ pulling up before VBUS becomes High.
>> >      USB device should be controlled according to VBUS state.
>> >
>> >     Root cause:
>> >      The current pch_udc is not always monitoring VBUS.
>> >
>> >     Solution:
>> >      The change of VBUS is detected using an interrupt of GPIO.
>> >      If VBUS became Low, pch_udc handles 'disconnect'.
>> >      After VBUS became High, a pull improves D+, and pch_udc
>> >      handles 'connect'.
>> >
>> >     [ balbi@ti.com : make it actually compile ]
>> >
>> >     Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
>> >     Signed-off-by: Felipe Balbi <balbi@ti.com>
>> > ---------------
>> >
>> > breaks the sparc builds in next:
>> >
>> > http://kisskb.ellerman.id.au/kisskb/buildresult/5771890/
>> > http://kisskb.ellerman.id.au/kisskb/buildresult/5771905/
>
> Ick, not good.
>
> Tomoya, can you please send me a patch to fix this?  Felipe is off-line
> for a few days and can't do this himself.
>
>
> greg k-h
