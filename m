From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH -next] x86: apic_flat_64.c needs module.h
Date: Mon, 23 May 2011 22:35:36 +0400
Message-ID: <4DDAA8F8.90605@gmail.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au> <20110523104300.dd532a99.randy.dunlap@oracle.com> <4DDA9EAB.40304@gmail.com> <4DDAA2C0.7080108@gmail.com> <4DDAA384.2000203@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:48378 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756143Ab1EWSfk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 14:35:40 -0400
In-Reply-To: <4DDAA384.2000203@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Suresh Siddha <suresh.b.siddha@intel.com>

On 05/23/2011 10:12 PM, Randy Dunlap wrote:
> On 05/23/11 11:09, Cyrill Gorcunov wrote:
>> On 05/23/2011 09:51 PM, Cyrill Gorcunov wrote:
>>> On 05/23/2011 09:43 PM, Randy Dunlap wrote:
>>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>>
>>>> apic_flat_64.c needs to include module.h to fix these warnings:
>>>>
>>>> arch/x86/kernel/apic/apic_flat_64.c:31: warning: data definition has no type or storage class
>>>> arch/x86/kernel/apic/apic_flat_64.c:31: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
>>>> arch/x86/kernel/apic/apic_flat_64.c:31: warning: parameter names (without types) in function declaration
>>>>
>>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>>>> ---
>>>>  arch/x86/kernel/apic/apic_flat_64.c |    1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> --- linux-next-20110523.orig/arch/x86/kernel/apic/apic_flat_64.c
>>>> +++ linux-next-20110523/arch/x86/kernel/apic/apic_flat_64.c
>>>> @@ -16,6 +16,7 @@
>>>>  #include <linux/ctype.h>
>>>>  #include <linux/init.h>
>>>>  #include <linux/hardirq.h>
>>>> +#include <linux/module.h>
>>>>  #include <asm/smp.h>
>>>>  #include <asm/apic.h>
>>>>  #include <asm/ipi.h>
>>>
>>> Thanks Randy! For some reason I didn't hit this problem while
>>> were compiling the kernel and testing it (I usually do not use
>>> modules though).
>>>
>>> I've CC'ed Ingo and Suresh.
>>>
>>
>> Randy, while adding module.h here is correct I fail to see why I didn't
>> hit this problem before, could you please post your config?
> 
> Certainly, it's attached.  It's a randconfig file.
> I saw this build error on roughly 5 out of 15 randconfig builds.
> 
> CONFIG_SMP is disabled...
> 
> 
> Thanks.
> 
> 

  CONFIG_SMP seems to be the point, unweaving headers deps backward is not
that convenient task, probably there is kinda automation tools exist? I
have a gut feeling I saw something but can't remember where exactly ;)

-- 
    Cyrill
