From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: build failure after merge of the cpufreq tree
Date: Wed, 29 Feb 2012 22:01:25 -0500
Message-ID: <20120301030125.GA27070@redhat.com>
References: <20120301135601.a164a12e2bd4aee871ff60db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35597 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932442Ab2CADBj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Feb 2012 22:01:39 -0500
Content-Disposition: inline
In-Reply-To: <20120301135601.a164a12e2bd4aee871ff60db@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Thu, Mar 01, 2012 at 01:56:01PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > After merging the cpufreq tree, today's linux-next build (x86_64
 > allmodconfig) failed like this:
 > 
 > drivers/cpufreq/cpufreq_ondemand.c: In function 'cpufreq_gov_dbs_init':
 > drivers/cpufreq/cpufreq_ondemand.c:880:28: error: 'PM_QOS_DVFS_RESPONSE_LATENCY' undeclared (first use in this function)
 > drivers/cpufreq/cpufreq_ondemand.c: In function 'cpufreq_gov_dbs_exit':
 > drivers/cpufreq/cpufreq_ondemand.c:896:25: error: 'PM_QOS_DVFS_RESPONSE_LATENCY' undeclared (first use in this function)
 > 
 > Caused by commit 500e8ca39c56 ("[CPUFREQ] ondemand: handle QoS request on
 > DVFS response latency").
 > 
 > I have used the cpufreq tree fomr next-20120229 for today.

gah, this patch was dependant upon another that didn't apply cleanly.

	Dave
