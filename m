From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pm tree
Date: Mon, 14 Nov 2016 10:40:09 +1100
Message-ID: <20161114104009.57b7e64b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753676AbcKMXkM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Nov 2016 18:40:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/cpufreq/powernv-cpufreq.c: In function 'gpstate_timer_handler':
drivers/cpufreq/powernv-cpufreq.c:642:5: warning: 'lpstate_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
  if (gpstate_idx != gpstates->last_lpstate_idx)
     ^

Introduced by commit

  20b15b766354 ("cpufreq: powernv: Use PMCR to verify global and local pstate")

-- 
Cheers,
Stephen Rothwell
