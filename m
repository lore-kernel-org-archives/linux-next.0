From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 30 Mar 2015 08:15:37 +0100
Message-ID: <20150330071536.GF24899@n2100.arm.linux.org.uk>
References: <20150330171334.6f377ba7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150330171334.6f377ba7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Lynch <nathan_lynch@mentor.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 30, 2015 at 05:13:34PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/kernel/vdso.c: In function 'tk_is_cntvct':
> arch/arm/kernel/vdso.c:273:15: error: 'const struct timekeeper' has no member named 'tkr'
>   if (strcmp(tk->tkr.clock->name, "arch_sys_counter") != 0)
>                ^
> arch/arm/kernel/vdso.c: In function 'update_vsyscall':
> arch/arm/kernel/vdso.c:319:32: error: 'struct timekeeper' has no member named 'tkr'
>    vdso_data->cs_cycle_last = tk->tkr.cycle_last;
>                                 ^
> arch/arm/kernel/vdso.c:321:36: error: 'struct timekeeper' has no member named 'tkr'
>    vdso_data->xtime_clock_snsec = tk->tkr.xtime_nsec;
>                                     ^
> arch/arm/kernel/vdso.c:322:27: error: 'struct timekeeper' has no member named 'tkr'
>    vdso_data->cs_mult  = tk->tkr.mult;
>                            ^
> arch/arm/kernel/vdso.c:323:28: error: 'struct timekeeper' has no member named 'tkr'
>    vdso_data->cs_shift  = tk->tkr.shift;
>                             ^
> arch/arm/kernel/vdso.c:324:27: error: 'struct timekeeper' has no member named 'tkr'
>    vdso_data->cs_mask  = tk->tkr.mask;
>                            ^
> 
> Caused by commit 876e78818def ("time: Rename timekeeper::tkr to
> timekeeper::tkr_mono") from the tip tree interacting with commit
> ecf99a439105 ("ARM: 8331/1: VDSO initialization, mapping, and
> synchronization") from the arm tree.
> 
> I added this merge fix patch for today (is that all that is needed?):

I'll drop the VDSO stuff from the ARM tree; I can't see a way to keep
it in my tree and keep my tree buildable without dragging in the tip
tree.

The ARM VDSO stuff will just have to wait for 4.2 instead.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
