From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Thu, 17 Dec 2015 12:21:54 +0100
Message-ID: <20151217112154.GE13078@piout.net>
References: <20151217160344.096b4a9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:60211 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756169AbbLQLV5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2015 06:21:57 -0500
Content-Disposition: inline
In-Reply-To: <20151217160344.096b4a9e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin <sasha.levin@oracle.com>

On 17/12/2015 at 16:03:44 +1100, Stephen Rothwell wrote :
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/built-in.o: In function `rtc_time64_to_tm':
> sunxi_sid.c:(.text+0x366e54): undefined reference to `__aeabi_ldivmod'
> sunxi_sid.c:(.text+0x366e6c): undefined reference to `__aeabi_ldivmod'
> 
> Caused by commit
> 
>   bfad4c280be0 ("rtc: fix overflow and incorrect calculation in rtc_time64_to_tm")
> 
> I have used the rtc tree from next-20151216 for today.
> 

Well, the kbuild test robot didn't complain at the time so I assumed
that it was ok to take the patch but indeed, there are more division
further in the function.

Sasha, I think I prefer having 32 bit platforms fail on the 21st of
January 11761191 rather than adding more uses of do_div in the function.
I'll have a look at the performance impact on 32 bit platforms.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
