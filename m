From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Tue, 14 Nov 2017 22:12:13 +1100 (AEDT)
Message-ID: <3yblG540Dpz9sRg@ozlabs.org>
References: <20171102174936.7cc061cc@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52943 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754453AbdKNLMP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 06:12:15 -0500
In-Reply-To: <20171102174936.7cc061cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>

On Thu, 2017-11-02 at 06:49:36 UTC, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> arch/powerpc/kernel/irq.o: In function `.replay_system_reset':
> irq.c:(.text+0x10): undefined reference to `.ppc_save_regs'
> 
> Caused by commit
> 
>   78adf6c214f0 ("powerpc/64s: Implement system reset idle wakeup reason")
> 
> I have applied the following fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Nov 2017 17:45:18 +1100
> Subject: [PATCH] powerpc/64s: ppc_save_regs is now needed for all 64s builds
> 
> Fixes: 78adf6c214f0 ("powerpc/64s: Implement system reset idle wakeup reason")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/fc2a5a6161a26b386eb0936b74a852

cheers
