From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Fri, 22 Jul 2016 11:56:20 +1000
Message-ID: <20160722115620.086b28ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41213 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752318AbcGVB4X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 21:56:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Muckle <steve.muckle@linaro.org>

Hi Rafael,

After merging the pm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "cpufreq_driver_resolve_freq" [kernel/sched/cpufreq_schedutil.ko] undefined!

Caused by commit

  5cbea46984d6 ("cpufreq: schedutil: map raw required frequency to driver frequency")

I used the pm tree from next-20160721 for today.

-- 
Cheers,
Stephen Rothwell
