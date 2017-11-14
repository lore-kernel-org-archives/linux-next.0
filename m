From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Nov 7
Date: Mon, 13 Nov 2017 16:03:14 -0800
Message-ID: <20171113160314.9924b06b389d9055f00d6a81@linux-foundation.org>
References: <20171107162217.382cd754@canb.auug.org.au>
        <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
        <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
        <20171110123054.5pnefm3mczsfv7bz@dhcp22.suse.cz>
        <CACPK8Xe5uUKEytkRiszdX511b_cYTD-z3X=ZsMcNJ-NOYnXfuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:54086 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751073AbdKNADR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2017 19:03:17 -0500
In-Reply-To: <CACPK8Xe5uUKEytkRiszdX511b_cYTD-z3X=ZsMcNJ-NOYnXfuQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Michal Hocko <mhocko@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 12 Nov 2017 11:38:02 +1030 Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Nov 10, 2017 at 11:00 PM, Michal Hocko <mhocko@kernel.org> wrote:
> > Hi Joel,
> >
> > On Wed 08-11-17 15:20:50, Michal Hocko wrote:
> > [...]
> >> > There are a lot of messages on the way up that look like this:
> >> >
> >> > [    2.527460] Uhuuh, elf segement at 000d9000 requested but the
> >> > memory is mapped already
> >> > [    2.540160] Uhuuh, elf segement at 000d9000 requested but the
> >> > memory is mapped already
> >> > [    2.546153] Uhuuh, elf segement at 000d9000 requested but the
> >> > memory is mapped already
> >> >
> >> > And then trying to run userspace looks like this:
> >>
> >> Could you please run with debugging patch posted
> >> http://lkml.kernel.org/r/20171107102854.vylrtaodla63kc57@dhcp22.suse.cz
> >
> > Did you have chance to test with this debugging patch, please?
> 
> Lots of this:
> 
> [    1.177266] Uhuuh, elf segement at 000d9000 requested but the
> memory is mapped already, got 000dd000
> [    1.177555] Clashing vma [dd000, de000] flags:100873 name:(null)
> 
> Full log is attached.
> 
> If you want to reproduce yourself and have an arm compiler lying around:
> 
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make aspeed_g5_defconfig
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make
> $ qemu-system-arm -M ast2500-evb -nographic -nodefaults -serial stdio \
>   -kernel arch/arm/boot/zImage \
>   -dtb arch/arm/boot/dts/aspeed-ast2500-evb.dtb
> 
> I'm using Qemu 2.10 which current distros ship. ymmv with older releases.

(wakes up)

Does this kernel have "fs/binfmt_elf.c: drop MAP_FIXED usage from
elf_map" applied?  That patch was dropped due to runtime issues.
