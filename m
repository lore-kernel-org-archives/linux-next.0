From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Thu, 20 Apr 2017 15:36:47 +1000
Message-ID: <20170420153647.1a93652b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1765646AbdDTFgu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 01:36:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

Hi Paul,

[Also reported by Michael elsewhere]

After merging the rcu tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

arch/powerpc/kvm/book3s_hv_rmhandlers.S: Assembler messages:
arch/powerpc/kvm/book3s_hv_rmhandlers.S:587: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:617: Error: operand out of range (0x0000000000009d88 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:619: Error: operand out of range (0x0000000000009dc0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:643: Error: operand out of range (0x0000000000009df8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:650: Error: operand out of range (0x0000000000009d8c is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1353: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1663: Error: operand out of range (0x0000000000009db0 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1665: Error: operand out of range (0x0000000000009dc8 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1734: Error: operand out of range (0x0000000000009db8 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1782: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1837: Error: operand out of range (0x0000000000009de0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1877: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1918: Error: operand out of range (0x0000000000009de0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1943: Error: operand out of range (0x000000000000a048 is not between 0xffffffffffff8000 and 0x0000000000007ffc)

Caused by commit

  b2bb79507ba1 ("srcu: Parallelize callback handling")

I have left it broken for today.

-- 
Cheers,
Stephen Rothwell
