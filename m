From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [next] powernv: cpufreq driver build fail for non-SMP
Date: Tue, 15 Apr 2014 10:11:11 -0400
Message-ID: <20140415141111.GA28352@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:49689 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaDOOLG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Apr 2014 10:11:06 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ego@linux.vnet.ibm.com
Cc: svaidy@linux.vnet.ibm.com, preeti@linux.vnet.ibm.com, srivatsa.bhat@linux.vnet.ibm.com, linux-next@vger.kernel.org, rafael.j.wysocki@intel.com

Hi all,

This new driver is causing build fails on linux-next for non-SMP.

http://kisskb.ellerman.id.au/kisskb/buildresult/10911507/

I didn't bisect since there are only two commits in total.  :)

Looks like some header foo where <linux/smp.h> is not getting <asm/smp.h>

Paul.
