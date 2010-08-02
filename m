From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: microblaze FAULT: memblock: Introduce for_each_memblock() and
 new accessors, and use it
Date: Tue, 03 Aug 2010 07:20:30 +1000
Message-ID: <1280784030.1902.62.camel@pasglop>
References: <4C569D26.1000907@petalogix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:42315 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753752Ab0HBVUm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Aug 2010 17:20:42 -0400
In-Reply-To: <4C569D26.1000907@petalogix.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michal.simek@petalogix.com
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On Mon, 2010-08-02 at 12:25 +0200, Michal Simek wrote:
> Hi Ben,
> 
> your commit 53e16bfaf19346f59b3502e207aa66c61332075c in linux-next
> breaks microblaze kernel compilation. It is easy to remove. Patch is 
> below. Please add this change to your commit.

Ooops. It may be too late to rebase, not sure. Ingo, are you sending
that stuff to Linus or are you waiting for me to do so ? In the later
case, I can fold that fix in easily.

Cheers,
Ben.

> Thanks,
> Michal
> 
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 10bae6e..840026c 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -143,7 +143,7 @@ void __init setup_memory(void)
> 
>          /* reserve allocate blocks */
>          for_each_memblock(reserved, reg) {
> -               pr_debug("reserved %d - 0x%08x-0x%08x\n", i,
> +               pr_debug("reserved - 0x%08x-0x%08x\n",
>                           (u32) reg->base, (u32) reg->size);
>                  reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
>          }
> 
> 
