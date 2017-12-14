From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging.current tree
Date: Thu, 14 Dec 2017 17:00:33 +1100
Message-ID: <20171214170033.24a606b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751186AbdLNGAf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 01:00:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>

Hi Greg,

After merging the staging.current tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/staging/android/ion/ion_cma_heap.c: In function 'ion_cma_allocate':
drivers/staging/android/ion/ion_cma_heap.c:38:14: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function)
  if (align > CONFIG_CMA_ALIGNMENT)
              ^

Caused by commit

  d98e6dbf42f7 ("staging: ion: Fix ion_cma_heap allocations")

CONFIG_CMA_ALIGNMENT (and CONFIG_DMA_CMA) is not set for this build.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
