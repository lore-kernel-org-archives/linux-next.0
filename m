From: "Aneesh Kumar K.V" <aneeshkumar.opensource@gmail.com>
Subject: Re: [BUG][linux-next][ppc] kernel panic - not syncing:
 stack-protector: Kernel stack is corrupted in: __schedule+0x978/0xa80
Date: Fri, 12 Oct 2018 14:32:59 +0530
Message-ID: <da8634b4-77ae-90e3-b6b4-fa1284ed8d85@linux.ibm.com>
References: <1539330331.17569.32.camel@abdul.in.ibm.com>
 <1539330499.17569.33.camel@abdul.in.ibm.com>
 <eef38553-779a-c7f5-500f-145dbf4b6a49@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eef38553-779a-c7f5-500f-145dbf4b6a49@c-s.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe LEROY <christophe.leroy@c-s.fr>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, npiggin <npiggin@gmail.com>, linux-next <linux-next@vger.kernel.org>, manvanth <manvanth@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On 10/12/18 1:38 PM, Christophe LEROY wrote:
> 
> 
> Le 12/10/2018 à 09:48, Abdul Haleem a écrit :
>> On Fri, 2018-10-12 at 13:15 +0530, Abdul Haleem wrote:
>>> Greeting's
>>>
>>> Today's linux-next fails to boot on powerpc bare-metal with this error
>>>
>>> POWER8 performance monitor hardware support registered
>>> rcu: Hierarchical SRCU implementation.
>>> smp: Bringing up secondary CPUs ...
>>> Kernel panic - not syncing: stack-protector: Kernel stack is 
>>> corrupted in: __schedule+0x978/0xa80
>>> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 
>>> 4.19.0-rc7-next-20181010-autotest-autotest #1
>>> Call Trace:
>>> [c000001fed5b3bf0] [c000000000a0ef3c] dump_stack+0xb0/0xf4 (unreliable)
>>> [c000001fed5b3c30] [c0000000000f9d68] panic+0x140/0x308
>>> [c000001fed5b3cc0] [c0000000000f9844] __stack_chk_fail+0x24/0x30
>>> [c000001fed5b3d20] [c000000000a2c3a8] __schedule+0x978/0xa80
>>> [c000001fed5b3e00] [c000000000a2c9b4] schedule_idle+0x34/0x60
>>> [c000001fed5b3e30] [c00000000013d344] do_idle+0x224/0x3d0
>>> [c000001fed5b3ec0] [c00000000013d6e0] cpu_startup_entry+0x30/0x50
>>> [c000001fed5b3ef0] [c000000000047f34] start_secondary+0x4d4/0x520
>>> [c000001fed5b3f90] [c00000000000b370] start_secondary_prolog+0x10/0x14
>>> Rebooting in 10 seconds..
>>>
>>> Machine: Power 8 bare-metal
>>> kernel version: 4.19.0-rc7-next-20181010
>>> gcc version: 4.8.5 20150623
>>> config attach
>>
>> Attaching the kernel config file
>>
> 
> # Linux/powerpc 4.11.0-rc4 Kernel Configuration
> 
> This is not the correct config file. Can you send the .config ?
> 
> Christophe

modified   kernel/sched/idle.c
@@ -352,7 +352,6 @@ void cpu_startup_entry(enum cpuhp_state state)
  	 * make this generic (ARM and SH have never invoked the canary
  	 * init for the non boot CPUs!). Will be fixed in 3.11
  	 */
-#ifdef CONFIG_X86
  	/*
  	 * If we're the non-boot CPU, nothing set the stack canary up
  	 * for us. The boot CPU already has it initialized but no harm
@@ -361,7 +360,6 @@ void cpu_startup_entry(enum cpuhp_state state)
  	 * canaries already on the stack wont ever trigger).
  	 */
  	boot_init_stack_canary();
-#endif
  	arch_cpu_idle_prepare();
  	cpuhp_online_idle(state);
  	while (1)


This fixes it for me. But we may have to look at the other arch details 
mentioned there.

-aneesh
