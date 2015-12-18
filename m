From: Sasha Levin <sasha.levin@oracle.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Fri, 18 Dec 2015 10:30:22 -0500
Message-ID: <5674268E.508@oracle.com>
References: <20151217160344.096b4a9e@canb.auug.org.au>
 <20151217112154.GE13078@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:20528 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932451AbbLRPaf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2015 10:30:35 -0500
In-Reply-To: <20151217112154.GE13078@piout.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/17/2015 06:21 AM, Alexandre Belloni wrote:
> On 17/12/2015 at 16:03:44 +1100, Stephen Rothwell wrote :
>> > Hi Alexandre,
>> > 
>> > After merging the rtc tree, today's linux-next build (arm
>> > multi_v7_defconfig) failed like this:
>> > 
>> > drivers/built-in.o: In function `rtc_time64_to_tm':
>> > sunxi_sid.c:(.text+0x366e54): undefined reference to `__aeabi_ldivmod'
>> > sunxi_sid.c:(.text+0x366e6c): undefined reference to `__aeabi_ldivmod'
>> > 
>> > Caused by commit
>> > 
>> >   bfad4c280be0 ("rtc: fix overflow and incorrect calculation in rtc_time64_to_tm")
>> > 
>> > I have used the rtc tree from next-20151216 for today.
>> > 
> Well, the kbuild test robot didn't complain at the time so I assumed
> that it was ok to take the patch but indeed, there are more division
> further in the function.

Yeah, I'm not sure what happened here. Compiler optimizations?

> Sasha, I think I prefer having 32 bit platforms fail on the 21st of
> January 11761191 rather than adding more uses of do_div in the function.
> I'll have a look at the performance impact on 32 bit platforms.

I'm really fine with just adding a WARN_ON() and aborting if it's the year
11761191 :)


Thanks,
Sasha
