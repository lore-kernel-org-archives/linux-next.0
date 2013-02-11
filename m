From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: linux-next: Tree for Feb 11 (intel_pstate.c)
Date: Mon, 11 Feb 2013 09:29:09 -0800
Message-ID: <51192A65.2020509@intel.com>
References: <20130211184749.565d8e47788f8be8aec1591f@canb.auug.org.au> <511919C7.5080502@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f181.google.com ([209.85.210.181]:38444 "EHLO
	mail-ia0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758225Ab3BKR3M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Feb 2013 12:29:12 -0500
In-Reply-To: <511919C7.5080502@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/11/2013 08:18 AM, Randy Dunlap wrote:
> On 02/10/13 23:47, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130208:
>>
>
> on i386:
>
> drivers/built-in.o: In function `intel_pstate_timer_func':
> intel_pstate.c:(.text+0x4ce97e): undefined reference to `__udivdi3'
> drivers/built-in.o: In function `intel_pstate_cpu_init':
> intel_pstate.c:(.cpuinit.text+0x974): undefined reference to `__udivdi3'
>
>
DOOH :-(  This patch fixes the issue.  I will work with Rafael to get it into
his next branch.

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 86ad482..e879963 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -456,7 +456,8 @@ static inline void intel_pstate_calc_busy(struct cpudata *cp
         core_pct = div64_u64(sample->aperf * 100, sample->mperf);
         sample->freq = cpu->pstate.turbo_pstate * core_pct * 1000;

-       sample->core_pct_busy = sample->pstate_pct_busy * core_pct / 100;
+       sample->core_pct_busy = div_s64((sample->pstate_pct_busy * core_pct),
+                                       100);
  }
