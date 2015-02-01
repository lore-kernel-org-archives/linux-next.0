From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 30 (clk related WARNING on arm)
Date: Sun, 01 Feb 2015 10:49:54 -0800
Message-ID: <54CE7552.9070600@roeck-us.net>
References: <20150130180209.2bd86cc4@canb.auug.org.au>	<20150130190709.GA13943@roeck-us.net> <CAMuHMdV64QF=WNxOgFn3mzpSCrA8amr6wrWQJFaZsUYozTVW=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53105 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753665AbbBASuG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Feb 2015 13:50:06 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YHzaw-002kg5-UG
	for linux-next@vger.kernel.org; Sun, 01 Feb 2015 18:50:07 +0000
In-Reply-To: <CAMuHMdV64QF=WNxOgFn3mzpSCrA8amr6wrWQJFaZsUYozTVW=Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@codeaurora.org>

On 02/01/2015 01:23 AM, Geert Uytterhoeven wrote:
> On Fri, Jan 30, 2015 at 8:07 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20150129:
>>>
>>> The arm-soc gained conflicts against the arm-current and arm trees.
>>>
>>> The spi tree gained a build failure for which I reverted a commit.
>>>
>>> Non-merge commits (relative to Linus' tree): 6300
>>>   6348 files changed, 255117 insertions(+), 131620 deletions(-)
>>>
>>> ----------------------------------------------------------------------------
>>>
>> I see the following runtime warning repeatedly (with different call
>> paths to vexpress_osc_round_rate) with my qemu vexpress test.
>>
>> Bisect points to commit cb75a8fcd14e71 ("clk: Add rate constraints to clocks").
>>
>> Guenter
>>
>> ---
>> WARNING: CPU: 0 PID: 1 at drivers/clk/versatile/clk-vexpress-osc.c:47
>> vexpress_osc_round_rate+0x58/0x64()
>
> See also the thread started at
> http://www.spinics.net/lists/linux-doc/msg28017.html
>
> Will try the patch after FOSDEM.
>
Hi Geert,

thanks a lot for the pointer.

Stephen Boyd's patch ("clk: Assign a requested rate by default")
fixes the problem seen in my test. Stephen, please feel free to add

Tested-by: Guenter Roeck <linux@roeck-us.net>

to that patch.

Thanks,
Guenter
