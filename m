From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm-arm tree
Date: Fri, 23 Sep 2016 13:31:16 +1000
Message-ID: <20160923133116.707a8f07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752101AbcIWDbT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Sep 2016 23:31:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>

Hi all,

After merging the kvm-arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

tmp/cc9rCfjd.s: Assembler messages:
tmp/cc9rCfjd.s:310: Error: bad or missing co-processor number -- `mcr "mrc","mcr","p15, 0, r2, c12, c12, 3",u32'
scripts/Makefile.build:290: recipe for target 'drivers/irqchip/irq-gic-v3.o' failed

Maybe caused by commit

  4f2546384150 ("ARM: Move system register accessors to asm/cp15.h")

I have used the kvm-arm tree from next-20160922 for today.

-- 
Cheers,
Stephen Rothwell
