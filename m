From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 22 (kvm)
Date: Mon, 29 Nov 2010 09:52:48 -0800
Message-ID: <4CF3E870.4040308@oracle.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>	<20101122132627.bd4e88ef.randy.dunlap@oracle.com> <20101129083324.6870d7da.randy.dunlap@oracle.com> <4CF3D637.6060204@redhat.com> <4CF3E733.8090809@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4CF3E733.8090809@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zachary Amsden <zamsden@redhat.com>
Cc: Avi Kivity <avi@redhat.com>, Glauber Costa <glommer@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/29/10 09:47, Zachary Amsden wrote:
> On 11/29/2010 06:35 AM, Avi Kivity wrote:
>> On 11/29/2010 06:33 PM, Randy Dunlap wrote:
>>> On Mon, 22 Nov 2010 13:26:27 -0800 Randy Dunlap wrote:
>>>
>>> >  On Mon, 22 Nov 2010 13:49:11 +1100 Stephen Rothwell wrote:
>>> >
>>> > >  Hi all,
>>> > >
>>> > >  Changes since 20101119:
>>> >
>>> >
>>> >  kvm.c:(.init.text+0x11f49): undefined reference to
>>> `kvm_register_clock'
>>> >
>>> >  when CONFIG_KVM_CLOCK is not enabled.
>>>
>>>
>>> BUild error still present in linux-next-2010-NOV-29.
>>>
>>
>> Glauber, Zach?
>>
> 
> I can only speculate this reference is being called from smpboot without
> CONFIG guarding?

Sorry, looks like I dropped the first line of the error messages:

arch/x86/built-in.o: In function `kvm_smp_prepare_boot_cpu':
kvm.c:(.init.text+0xad38): undefined reference to `kvm_register_clock'

from arch/x86/kernel/kvm.c:

#ifdef CONFIG_SMP
static void __init kvm_smp_prepare_boot_cpu(void)
{
	WARN_ON(kvm_register_clock("primary cpu clock"));
	kvm_guest_cpu_init();
	native_smp_prepare_boot_cpu();
}

so it looks like you are correct...

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
