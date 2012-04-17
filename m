From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: fix android alarm.c printk format warnings
Date: Mon, 16 Apr 2012 18:01:24 -0700
Message-ID: <4F8CC0E4.5030706@xenotime.net>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@linux-foundation.org>, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings by using 't' modifier for ptrdiff_t.

drivers/staging/android/alarm.c:344:2: warning: format '%ld' expects type 'long int', but argument 2 has type 'int'
drivers/staging/android/alarm.c:367:3: warning: format '%ld' expects type 'long int', but argument 2 has type 'int'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Greg KH <greg@kroah.com>
Cc: Brian Swetland <swetland@google.com>
---
 drivers/staging/android/alarm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20120416.orig/drivers/staging/android/alarm.c
+++ linux-next-20120416/drivers/staging/android/alarm.c
@@ -341,7 +341,7 @@ static enum hrtimer_restart alarm_timer_
 	now = base->stopped ? base->stopped_time : hrtimer_cb_get_time(timer);
 	now = ktime_sub(now, base->delta);
 
-	pr_alarm(INT, "alarm_timer_triggered type %ld at %lld\n",
+	pr_alarm(INT, "alarm_timer_triggered type %td at %lld\n",
 		base - alarms, ktime_to_ns(now));
 
 	while (base->first) {
@@ -364,7 +364,7 @@ static enum hrtimer_restart alarm_timer_
 		spin_lock_irqsave(&alarm_slock, flags);
 	}
 	if (!base->first)
-		pr_alarm(FLOW, "no more alarms of type %ld\n", base - alarms);
+		pr_alarm(FLOW, "no more alarms of type %td\n", base - alarms);
 	update_timer_locked(base, true);
 	spin_unlock_irqrestore(&alarm_slock, flags);
 	return HRTIMER_NORESTART;
