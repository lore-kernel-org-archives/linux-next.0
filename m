From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc tree
Date: Fri, 19 Jan 2018 16:53:19 +1100
Message-ID: <20180119165319.524cf2ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42027 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750923AbeASFxW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jan 2018 00:53:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/kernel/mce_power.o: In function `.mce_handle_error':
mce_power.c:(.text+0x5a8): undefined reference to `.hash__tlbiel_all'
mce_power.c:(.text+0x6b8): undefined reference to `.hash__tlbiel_all'
arch/powerpc/mm/hash_utils_64.o: In function `.hash__early_init_mmu':
hash_utils_64.c:(.init.text+0x9d0): undefined reference to `.hash__tlbiel_all'

Caused by commit

  d4748276ae14 ("powerpc/64s: Improve local TLB flush for boot and MCE on POWER9")

The definition of hash__tlbiel_all() is in
arch/powerpc/mm/hash_native_64.c which is only built if CONFIG_PPC_NATIVE
is set, which it is not for this build.

I applied a supplied fix patch.

-- 
Cheers,
Stephen Rothwell
