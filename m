From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Wed, 9 Dec 2015 12:54:41 +1100
Message-ID: <20151209125441.630ef17e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "gov_cancel_work" [drivers/cpufreq/cpufreq_ondemand.ko] undefined!

Caused by commit

  68e115b19a01 ("cpufreq: governor: replace per-cpu delayed work with timers")

I have used the pm tree from next-20151208 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
