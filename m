From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Fri, 1 Apr 2016 12:27:43 +1100
Message-ID: <20160401122743.08b7a655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51300 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753552AbcDAB1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Mar 2016 21:27:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "__tracepoint_cpu_frequency" [kernel/sched/cpufreq_schedutil.ko] undefined!

Caused by commit

  d4913d2934b5 ("cpufreq: schedutil: New governor based on scheduler utilization data")

I have used the pm tree from next-20160331 for today.

-- 
Cheers,
Stephen Rothwell
