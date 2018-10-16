From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: qemu boot failures with today's linux-next
Date: Tue, 16 Oct 2018 20:36:59 +1100
Message-ID: <87pnwakzb8.fsf@concordia.ellerman.id.au>
References: <20181015191859.2f600de5@canb.auug.org.au> <87murfz8dl.fsf@concordia.ellerman.id.au> <20181016105240.70369b98@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016105240.70369b98@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Booting Linux via __start() @ 0x0000000000400000 ...
>> 
>> If you git Ctrl-a-c you should get the qemu prompt. Then you can run
>> 'info registers' to print the regs and maybe see where it's stuck.
>> 
>> And/or build with EARLY_DEBUG_LPAR to get early console output.
>
> That gave one more line:
>
> [    0.000000] printk: bootconsole [udbg0] enabled

Yeah I tried it too, it must have crashed *really* early :)

cheers
