From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: timers tree build failure
Date: Mon, 29 Dec 2008 13:30:28 +1100
Message-ID: <20081229133028.363f5094.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36725 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751196AbYL2Caa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 21:30:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/core/hrtimer.c: In function 'snd_hrtimer_open':
sound/core/hrtimer.c:60: error: 'struct hrtimer' has no member named 'cb_mode'
sound/core/hrtimer.c:60: error: 'HRTIMER_CB_IRQSAFE_UNLOCKED' undeclared (first use in this function)

See below ... the sound tree changes are now in Linus' tree, so this
needs fixing before the timers tree gets merged.

I have applied the merge fix below (which is also in the sound tree) to
the timers tree for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

Date: Mon, 15 Dec 2008 15:43:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@elte.hu>
Subject: linux-next: sound tree build failure

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/core/hrtimer.c: In function 'snd_hrtimer_open':
sound/core/hrtimer.c:60: error: 'struct hrtimer' has no member named 'cb_mode'
sound/core/hrtimer.c:60: error: 'HRTIMER_CB_IRQSAFE_UNLOCKED' undeclared (first use in this function)

An interaction between commit bbaf5e97337287479eb78dbc3822d9560bbfd2e2
("ALSA: Add hrtimer backend for ALSA timer interface") from the sound
tree and commit ca109491f612aab5c8152207631c0444f63da97f ("hrtimer:
removing all ur callback modes") from the timers tree.

I have added the below fixup for the merge and can carry it as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Dec 2008 15:38:14 +1100
Subject: [PATCH] sound: fixup for timers tree interaction

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/core/hrtimer.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index c1d2859..34c7d48 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -57,7 +57,6 @@ static int snd_hrtimer_open(struct snd_timer *t)
 		return -ENOMEM;
 	hrtimer_init(&stime->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	stime->timer = t;
-	stime->hrt.cb_mode = HRTIMER_CB_IRQSAFE_UNLOCKED;
 	stime->hrt.function = snd_hrtimer_callback;
 	t->private_data = stime;
 	return 0;
-- 
1.6.0.5
