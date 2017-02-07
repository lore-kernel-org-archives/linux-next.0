From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 8 Feb 2017 10:08:03 +1100
Message-ID: <20170208100803.37cbed40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754834AbdBGXIL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Feb 2017 18:08:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, Hillf Danton <hillf.zj@alibaba-inc.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
allnoconfig, bfin (most, if not all, configs) and many others) failed
like this:

mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
mm/nommu.c:1638:1: error: conflicting types for 'do_munmap'
ipc/shm.c:1368:3: error: too few arguments to function 'do_munmap'

Caused by commit

  24424bfbce7e ("userfaultfd: non-cooperative: add event for memory unmaps")

This forgot to update the mm/nommu.c versions of these functions :-(

Sorry for not reporting this earlier.

I have no idea what to do about this as this patch is deep within the mm
changes and so almost certainly will not revert cleanly (and dropping
this patch will presumably have flow on effects to the reset of the
mm patches).

-- 
Cheers,
Stephen Rothwell
