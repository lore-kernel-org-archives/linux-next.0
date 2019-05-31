From: Dexuan-Linux Cui <dexuan.linux@gmail.com>
Subject: Re: [next-20190530] Boot failure on PowerPC
Date: Fri, 31 May 2019 11:13:26 -0700
Message-ID: <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <87h89aohnu.fsf@concordia.ellerman.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Dexuan Cui <decui@microsoft.com>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, v-lide@microsoft.com
List-Id: linux-next.vger.kernel.org

On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> > Latest next fails to boot with a kernel panic on POWER9.
> >
> > [   33.689332] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: write_irq_affinity.isra.5+0x15c/0x160
> > [   33.689346] CPU: 35 PID: 4907 Comm: irqbalance Not tainted 5.2.0-rc2-next-20190530-autotest-autotest #1
> > [   33.689352] Call Trace:
> > [   33.689356] [c0000018d974bab0] [c000000000b5328c] dump_stack+0xb0/0xf4 (unreliable)
> > [   33.689364] [c0000018d974baf0] [c000000000120694] panic+0x16c/0x408
> > [   33.689370] [c0000018d974bb80] [c00000000012010c] __stack_chk_fail+0x2c/0x30
> > [   33.689376] [c0000018d974bbe0] [c0000000001b859c] write_irq_affinity.isra.5+0x15c/0x160
> > [   33.689383] [c0000018d974bd30] [c0000000004d6f30] proc_reg_write+0x90/0x110
> > [   33.689388] [c0000018d974bd60] [c00000000041453c] __vfs_write+0x3c/0x70
> > [   33.689394] [c0000018d974bd80] [c000000000418650] vfs_write+0xd0/0x250
> > [   33.689399] [c0000018d974bdd0] [c000000000418a2c] ksys_write+0x7c/0x130
> > [   33.689405] [c0000018d974be20] [c00000000000b688] system_call+0x5c/0x70
> >
> > Machine boots till login prompt and then panics few seconds later.
> >
> > Last known next build was May 24th. Will attempt few builds till May 30 to
> > narrow down this problem.
>
> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>
> cheers

Hi Sachin,
It looks this patch may fix the issue:
https://lkml.org/lkml/2019/5/30/1630 , but I'm not sure.

Thanks
-- Dexuan
