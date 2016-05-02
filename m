From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Mon, 2 May 2016 07:47:49 -0700
Message-ID: <20160502144749.GA32151@kroah.com>
References: <20160502154258.312e00b7@canb.auug.org.au>
 <20160502113726.GA22131@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49351 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752805AbcEBOrv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 10:47:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A2D420ACC
	for <linux-next@vger.kernel.org>; Mon,  2 May 2016 10:47:50 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20160502113726.GA22131@sophia>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Mon, May 02, 2016 at 07:40:47AM -0400, William Breathitt Gray wrote:
> On Mon, May 02, 2016 at 03:42:58PM +1000, Stephen Rothwell wrote:
> >Hi Greg,
> >
> >After merging the driver-core tree, today's linux-next build (x86_64
> >allmodconfig) failed like this:
> >
> >In file included from include/uapi/linux/stddef.h:1:0,
> >                 from include/linux/stddef.h:4,
> >                 from include/uapi/linux/posix_types.h:4,
> >                 from include/uapi/linux/types.h:13,
> >                 from include/linux/types.h:5,
> >                 from include/linux/list.h:4,
> >                 from include/linux/module.h:9,
> >                 from arch/x86/mm/extable.c:1:
> >arch/x86/mm/extable.c: In function 'fixup_exception':
> >arch/x86/mm/extable.c:102:15: error: implicit declaration of function 'SEGMENT_IS_PNP_CODE' [-Werror=implicit-function-declaration]
> >  if (unlikely(SEGMENT_IS_PNP_CODE(regs->cs))) {
> >               ^
> >drivers/pnp/pnpbios/bioscalls.c:106:34: error: 'PNP_TS1' und
> >eclared (first use in this function)
> >   Q2_SET_SEL(smp_processor_id(), PNP_TS1, ts1_base, ts1_size);
> >                                  ^
> >drivers/pnp/pnpbios/bioscalls.c:108:34: error: 'PNP_TS2' undeclared (first use in this function)
> >   Q2_SET_SEL(smp_processor_id(), PNP_TS2, ts2_base, ts2_size);
> >                                  ^
> >drivers/pnp/pnpbios/bioscalls.c:133:13: error: 'PNP_CS32' undeclared (first use in this function)
> >         "i"(PNP_CS32), "i"(0)
> >             ^
> >
> >and on ...
> >
> >Somehow caused by commit
> >
> >  8ac0fba2da41 ("isa: Decouple X86_32 dependency from the ISA Kconfig option")
> >
> >I don't easily see why it causes the problem, but reverting it makes the
> >build work.  I also cannot rule out interaction with some other tree.
> >
> >I have reverted that commit for today.
> >
> >-- 
> >Cheers,
> >Stephen Rothwell
> 
> The PnP errors are due to an overly broad Kconfig dependency list, and
> are resolved with the following patch:
> <https://lkml.org/lkml/2016/5/1/100>. This patch should be applied first
> to prevent the PnP build for X86_64, when the X86_32 dependency is
> decoupled from the ISA Kconfig option in this current patch.

You didn't tell me that when I applied the above patch :(

I'll go apply the pnp patch now, but really, please be more careful with
dependancies next time.

greg k-h
