From: Zachary Amsden <zamsden@redhat.com>
Subject: Re: linux-next: Tree for November 22 (kvm)
Date: Mon, 29 Nov 2010 08:08:30 -1000
Message-ID: <4CF3EC1E.7050707@redhat.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>	<20101122132627.bd4e88ef.randy.dunlap@oracle.com> <20101129083324.6870d7da.randy.dunlap@oracle.com> <4CF3D637.6060204@redhat.com> <4CF3E733.8090809@redhat.com> <4CF3E870.4040308@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28551 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755377Ab0K2SIh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Nov 2010 13:08:37 -0500
In-Reply-To: <4CF3E870.4040308@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Avi Kivity <avi@redhat.com>, Glauber Costa <glommer@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 11/29/2010 07:52 AM, Randy Dunlap wrote:
> On 11/29/10 09:47, Zachary Amsden wrote:
>    
>> On 11/29/2010 06:35 AM, Avi Kivity wrote:
>>      
>>> On 11/29/2010 06:33 PM, Randy Dunlap wrote:
>>>        
>>>> On Mon, 22 Nov 2010 13:26:27 -0800 Randy Dunlap wrote:
>>>>
>>>>          
>>>>>   On Mon, 22 Nov 2010 13:49:11 +1100 Stephen Rothwell wrote:
>>>>>
>>>>>            
>>>>>>   Hi all,
>>>>>>
>>>>>>   Changes since 20101119:
>>>>>>              
>>>>>
>>>>>   kvm.c:(.init.text+0x11f49): undefined reference to
>>>>>            
>>>> `kvm_register_clock'
>>>>          
>>>>>   when CONFIG_KVM_CLOCK is not enabled.
>>>>>            
>>>>
>>>> BUild error still present in linux-next-2010-NOV-29.
>>>>
>>>>          
>>> Glauber, Zach?
>>>
>>>        
>> I can only speculate this reference is being called from smpboot without
>> CONFIG guarding?
>>      
> Sorry, looks like I dropped the first line of the error messages:
>
> arch/x86/built-in.o: In function `kvm_smp_prepare_boot_cpu':
> kvm.c:(.init.text+0xad38): undefined reference to `kvm_register_clock'
>
> from arch/x86/kernel/kvm.c:
>
> #ifdef CONFIG_SMP
> static void __init kvm_smp_prepare_boot_cpu(void)
> {
> 	WARN_ON(kvm_register_clock("primary cpu clock"));
> 	kvm_guest_cpu_init();
> 	native_smp_prepare_boot_cpu();
> }
>
> so it looks like you are correct...
>    

Looks like this is the appropriate fix:

#ifdef CONFIG_SMP
static void __init kvm_smp_prepare_boot_cpu(void)
{
#ifdef CONFIG_KVM_CLOCK
	WARN_ON(kvm_register_clock("primary cpu clock"));
#endif
	kvm_guest_cpu_init();
	native_smp_prepare_boot_cpu();
}


The SMP code is still buggy as well, wrt printk timing, in that it 
doesn't get called early enough, correct?  Has anyone thought of a good 
solution to that problem?

Basically the problem is CPU-1 will get CPU-0's per-cpu areas copied 
over, and these are not valid for CPU-1.  If the clocksource is used on 
CPU-1 before kvm clock gets setup, it can go backwards, wreaking havoc, 
causing panic, etc.

What is the best test to guard against this?  Perhaps we should keep the 
CPU number in the per-cpu data and test against it?
