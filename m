From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: linux-next: Tree for Mar 11 (arm:multi_v5_defconfig build failure)
Date: Wed, 11 Mar 2015 17:26:56 +0100
Message-ID: <55006CD0.8030009@free-electrons.com>
References: <20150311163558.6a09cfcc@canb.auug.org.au> <20150311155548.GB22446@roeck-us.net> <20150311162140.GR1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:55100 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750839AbbCKQ1A (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2015 12:27:00 -0400
In-Reply-To: <20150311162140.GR1509@kw.sim.vm.gnt>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Guinot <simon.guinot@sequanux.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>

On 11/03/2015 17:21, Simon Guinot wrote:
> On Wed, Mar 11, 2015 at 08:55:48AM -0700, Guenter Roeck wrote:
>> On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20150310:
>>>
>>> New tree: drm-exynos
>>>
>>> The sound-asoc tree still had its build failure so I used the version from
>>> next-20150306.
>>>
>>> The regulator tree lost its build failure.
>>>
>>> The tip tree gained a conflict against the usb-gadget-fixes tree.
>>>
>>> The staging tree lost its build failure.
>>>
>>> Non-merge commits (relative to Linus' tree): 3446
>>>  3448 files changed, 138744 insertions(+), 73083 deletions(-)
>>>
>>> ----------------------------------------------------------------------------
>>>
>> Building arm:multi_v5_defconfig ... failed
>> --------------
>> Error log:
>> arch/arm/boot/dts/kirkwood-nas2big.dts:15:43: fatal error:
>> 	dt-bindings/leds/leds-netxbig.h: No such file or directory
>>  #include <dt-bindings/leds/leds-netxbig.h>
>>
>> Caused by commit a9e58557e99 ("ARM: Kirkwood: add DT description for nas2big").
>> Yes, that file doesn't exist.
> 
> Hi,
> 
> This should be fixed quickly. I sent a patch this morning:
> http://www.spinics.net/lists/arm-kernel/msg404676.html
> 
> I believe that Gregory will merge or squash this patch soon in the
> mvebu/for-next branch.

Indeed I planed to do it today

> 
> I apologize for the inconvenience.
> 
> Simon
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
