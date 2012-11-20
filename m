From: Rik van Riel <riel@redhat.com>
Subject: Re: [PATCH linux-next] cpuidle: fix a suspicious RCU usage in menu
 governor
Date: Tue, 20 Nov 2012 11:04:09 -0500
Message-ID: <50ABA9F9.1020105@redhat.com>
References: <1353404893.3694.42.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39211 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752881Ab2KTQEO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Nov 2012 11:04:14 -0500
In-Reply-To: <1353404893.3694.42.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, youquan.song@intel.com, rafael.j.wysocki@intel.com, paulmck@linux.vnet.ibm.com

On 11/20/2012 04:48 AM, Li Zhong wrote:
> I saw this suspicious RCU usage on the next tree of 11/15
>
> [   67.123404] ===============================
> [   67.123413] [ INFO: suspicious RCU usage. ]
> [   67.123423] 3.7.0-rc5-next-20121115-dirty #1 Not tainted
> [   67.123434] -------------------------------
> [   67.123444] include/trace/events/timer.h:186 suspicious rcu_dereference_check() usage!

> hrtimer_start was added in 198fd638 and ae515197. The patch below tries
> to use RCU_NONIDLE around it to avoid the above report.
>
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>

Reviewed-by: Rik van Riel <riel@redhat.com>

-- 
All rights reversed
