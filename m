From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [BUG][linux-next][ppc] kernel panic - not syncing: stack-protector:
 Kernel stack is corrupted in: __schedule+0x978/0xa80
Date: Fri, 12 Oct 2018 13:15:31 +0530
Message-ID: <1539330331.17569.32.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, mpe <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, manvanth <manvanth@linux.vnet.ibm.com>, npiggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Greeting's

Today's linux-next fails to boot on powerpc bare-metal with this error

POWER8 performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: __schedule+0x978/0xa80
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.19.0-rc7-next-20181010-autotest-autotest #1
Call Trace:
[c000001fed5b3bf0] [c000000000a0ef3c] dump_stack+0xb0/0xf4 (unreliable)
[c000001fed5b3c30] [c0000000000f9d68] panic+0x140/0x308
[c000001fed5b3cc0] [c0000000000f9844] __stack_chk_fail+0x24/0x30
[c000001fed5b3d20] [c000000000a2c3a8] __schedule+0x978/0xa80
[c000001fed5b3e00] [c000000000a2c9b4] schedule_idle+0x34/0x60
[c000001fed5b3e30] [c00000000013d344] do_idle+0x224/0x3d0
[c000001fed5b3ec0] [c00000000013d6e0] cpu_startup_entry+0x30/0x50
[c000001fed5b3ef0] [c000000000047f34] start_secondary+0x4d4/0x520
[c000001fed5b3f90] [c00000000000b370] start_secondary_prolog+0x10/0x14
Rebooting in 10 seconds..

Machine: Power 8 bare-metal
kernel version: 4.19.0-rc7-next-20181010
gcc version: 4.8.5 20150623
config attach

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
