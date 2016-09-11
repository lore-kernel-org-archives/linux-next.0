From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 12 Sep 2016 09:17:23 +1000
Message-ID: <20160912091723.614b1378@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35072 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752989AbcIKXR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Sep 2016 19:17:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  drivers/perf/arm_pmu.c

between commit:

  63fb0a9516b2 ("drivers/perf: arm_pmu: Fix NULL pointer dereference during probe")

from Linus' tree and commit:

  282b87963556 ("drivers/perf: arm_pmu: Always consider IRQ0 as an error")

from the arm64 tree.

I fixed it up (I just used the version from the arm64 tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
