From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] olpc: olpc-xo1-sci.c is an input driver, depends on INPUT
Date: Thu, 29 Sep 2011 13:36:59 -0700
Message-ID: <4E84D6EB.3020300@xenotime.net>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>	<4E84D259.5020008@xenotime.net> <20110929133446.40ff3250@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110929133446.40ff3250@queued.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86 maintainers <x86@kernel.org>, dsd@laptop.org
List-Id: linux-next.vger.kernel.org

On 09/29/11 13:34, Andres Salomon wrote:
> On Thu, 29 Sep 2011 13:17:29 -0700
> Randy Dunlap <rdunlap@xenotime.net> wrote:
> 
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> Fix build errors when CONFIG_INPUT is disabled (shortened list):
>>
>> olpc-xo1-sci.c:(.text+0x1aee6): undefined reference to `input_event'
>> olpc-xo1-sci.c:(.text+0x1b077): undefined reference to
>> `input_unregister_device' olpc-xo1-sci.c:(.text+0x1b081): undefined
>> reference to `input_free_device'
>> arch/x86/built-in.o:olpc-xo1-sci.c:(.text+0x1b270): more undefined
>> references to `input_event' follow
>> olpc-xo1-sci.c:(.devinit.text+0x155): undefined reference to
>> `input_allocate_device' olpc-xo1-sci.c:(.devinit.text+0x1a4):
>> undefined reference to `input_register_device'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>> Cc: Andres Salomon <dilinger@debian.org>
>> ---
>> Found in linux-next but also applies to mainline.
>>
>>  arch/x86/Kconfig |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- next-2011-0929.orig/arch/x86/Kconfig
>> +++ next-2011-0929/arch/x86/Kconfig
>> @@ -2052,7 +2052,7 @@ config OLPC_XO1_RTC
>>  
>>  config OLPC_XO1_SCI
>>  	bool "OLPC XO-1 SCI extras"
>> -	depends on OLPC && OLPC_XO1_PM
>> +	depends on OLPC && OLPC_XO1_PM && INPUT
>>  	select POWER_SUPPLY
>>  	select GPIO_CS5535
>>  	select MFD_CORE
> 
> Thanks!
> 
> Hm.  This might actually need a 'select INPUT' though, since
> OLPC_XO1_SCI is bool while INPUT is tristate.  Sigh, bool..

I try to avoid using "select", but you can resubmit the patch
to do that if you must.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
