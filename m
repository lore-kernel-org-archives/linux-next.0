From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 19 (waketorture.c)
Date: Tue, 19 Apr 2016 12:34:10 -0700
Message-ID: <57168832.9020400@infradead.org>
References: <20160419151347.0bdf706b@canb.auug.org.au>
 <57165AC8.9070702@infradead.org> <20160419165606.GB3837@linux.vnet.ibm.com>
 <57167109.6010608@infradead.org> <20160419190533.GG3837@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38204 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752918AbcDSTeM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2016 15:34:12 -0400
In-Reply-To: <20160419190533.GG3837@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/19/16 12:05, Paul E. McKenney wrote:
> On Tue, Apr 19, 2016 at 10:55:21AM -0700, Randy Dunlap wrote:
>> On 04/19/16 09:56, Paul E. McKenney wrote:
>>> On Tue, Apr 19, 2016 at 09:20:24AM -0700, Randy Dunlap wrote:
>>>> On 04/18/16 22:13, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20160418:
>>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> kernel/built-in.o: In function `wake_torture_stats_print':
>>>> waketorture.c:(.text+0x2f06d): undefined reference to `trace_clock_global'
>>>> kernel/built-in.o: In function `wake_torture_waiter':
>>>> waketorture.c:(.text+0x2f196): undefined reference to `trace_clock_local'
>>>> waketorture.c:(.text+0x2f1bc): undefined reference to `trace_clock_local'
>>>> waketorture.c:(.text+0x2f1d4): undefined reference to `trace_clock_local'
>>>> waketorture.c:(.text+0x2f237): undefined reference to `trace_clock_local'
>>>> waketorture.c:(.text+0x2f253): undefined reference to `trace_clock_local'
>>>> kernel/built-in.o:waketorture.c:(.text+0x2f318): more undefined references to `trace_clock_local' follow
>>>> kernel/built-in.o: In function `wake_torture_init':
>>>> waketorture.c:(.init.text+0x2b3f): undefined reference to `trace_clock_global'
>>>>
>>>>
>>>> Full randconfig file is attached.
>>>
>>> I don't see the .config, could you please send it to me?
>>>
>>> Looks like I need to add a few "depends" or "selects" clauses...
>>
>> Weird, mail client told me that it was attaching the config file.
>> Trying again...
> 
> I know that feeling!
> 
> Does the following patch help?  (The 64BIT is unrelated, feel free
> to back that part out if you wish.)

Yes, that works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 8644658e75c0..a42570a0fb56 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1434,7 +1434,8 @@ config RCU_TORTURE_TEST_SLOW_CLEANUP_DELAY
>  config WAKE_TORTURE_TEST
>  	tristate "Torture test for wakeups and CPU hotplug"
>  	depends on DEBUG_KERNEL
> -	depends on X86_64 || ARM64 || PPC64 || MIPS
> +	depends on 64BIT
> +	depends on TRACE_CLOCK
>  	select TORTURE_TEST
>  	default n
>  	help
> 



-- 
~Randy
