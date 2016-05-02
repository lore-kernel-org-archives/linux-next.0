From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the driver-core tree
Date: Mon, 2 May 2016 15:42:58 +1000
Message-ID: <20160502154258.312e00b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53209 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751042AbcEBFnA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 01:43:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>, Ingo Molnar <mingo@kernel.org>

Hi Greg,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/uapi/linux/stddef.h:1:0,
                 from include/linux/stddef.h:4,
                 from include/uapi/linux/posix_types.h:4,
                 from include/uapi/linux/types.h:13,
                 from include/linux/types.h:5,
                 from include/linux/list.h:4,
                 from include/linux/module.h:9,
                 from arch/x86/mm/extable.c:1:
arch/x86/mm/extable.c: In function 'fixup_exception':
arch/x86/mm/extable.c:102:15: error: implicit declaration of function 'SEGMENT_IS_PNP_CODE' [-Werror=implicit-function-declaration]
  if (unlikely(SEGMENT_IS_PNP_CODE(regs->cs))) {
               ^
drivers/pnp/pnpbios/bioscalls.c:106:34: error: 'PNP_TS1' und
eclared (first use in this function)
   Q2_SET_SEL(smp_processor_id(), PNP_TS1, ts1_base, ts1_size);
                                  ^
drivers/pnp/pnpbios/bioscalls.c:108:34: error: 'PNP_TS2' undeclared (first use in this function)
   Q2_SET_SEL(smp_processor_id(), PNP_TS2, ts2_base, ts2_size);
                                  ^
drivers/pnp/pnpbios/bioscalls.c:133:13: error: 'PNP_CS32' undeclared (first use in this function)
         "i"(PNP_CS32), "i"(0)
             ^

and on ...

Somehow caused by commit

  8ac0fba2da41 ("isa: Decouple X86_32 dependency from the ISA Kconfig option")

I don't easily see why it causes the problem, but reverting it makes the
build work.  I also cannot rule out interaction with some other tree.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
