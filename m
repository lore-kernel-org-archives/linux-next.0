From: Andrew Jones <drjones@redhat.com>
Subject: Re: linux-next: Tree for Apr 24
Date: Fri, 5 May 2017 20:55:50 +0200
Message-ID: <20170505185550.xyhndktiw5gfbqix@hawk.localdomain>
Reply-To: CAP=VYLrEVMbEnnLkOvjmJ5pw2YO0Cwbdq2oF_LJexeHJqhW=jg@mail.gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: paul.gortmaker@windriver.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, tglx@linutronix.de
List-Id: linux-next.vger.kernel.org

On Mon, Apr 24, 2017 at 11:44:13AM -0400, Paul Gortmaker wrote:
> There are also some new fails around kernel/events/core.c in arm32/arm64
> 
> include/linux/jump_label.h: In function
> ‘static_key_disable_cpuslocked.constprop.66’:
> include/linux/jump_label.h:260:20: error: inlining failed in call to
> always_inline ‘static_key_disable_cpuslocked.constprop.66’: recursive
> inlining
>  static inline void static_key_disable_cpuslocked(struct static_key *key)
>                     ^
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/13011884/
> http://kisskb.ellerman.id.au/kisskb/buildresult/13011947/
> ...and others.
> 
> A mindless automated bisect run came back with this:
> 
> 924726b2b5e5000dfb8eb6032651baed1b1bdc6c is the first bad commit
> commit 924726b2b5e5000dfb8eb6032651baed1b1bdc6c
> Author: Thomas Gleixner <tglx@xxxxxxxxxxxxx>
> Date:   Sun Apr 23 12:13:09 2017 +0200
> 
>     perf: Cure hotplug lock ordering issues
> 
> I gave tglx and peterz a heads up on irc.
>

Sorry if this is a repeat, but I'm not sure if this has been resolved
yet, as I'm not on any of the mailing lists where it would be posted
and google isn't revealing anything besides this mail I'm replying to
(please keep me on CC in replies, as I'm not on the lists).

I bumped into a problem which bisecting led to this same commit.  And,
it turns out the problem is the same one pointed out above, i.e. the
recursive inlining report.  The following patch fixes the issue.

Thanks,
drew

>From 0a8d642d17c6a93e927435ce9b6d2eaaeb19263b Mon Sep 17 00:00:00 2001
From: Andrew Jones <drjones@redhat.com>
Date: Fri, 5 May 2017 19:54:35 +0200
Subject: [PATCH] jump_label: fix stack overflow

Fix a typo that leads to static_key_disable_cpuslocked infinitely
recursing.  This was found when the PMU kvm-unit-tests test for ARM
crashed the host and bisection lead to 924726b2b5e5 "perf: Cure
hotplug lock ordering issues".  That commit was just the victim,
the culprit commit is identified below in 'Fixes'.

Fixes: fc932a0477d0 "jump_label: Provide static_key_[disable|/slow_dec]_cpuslocked()"
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/linux/jump_label.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
index 6e3ebf2a39ede..bedd55849c2e3 100644
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@ -259,7 +259,7 @@ static inline void static_key_disable(struct static_key *key)
 
 static inline void static_key_disable_cpuslocked(struct static_key *key)
 {
-	static_key_disable_cpuslocked(key);
+	static_key_disable(key);
 }
 
 #define STATIC_KEY_INIT_TRUE	{ .enabled = ATOMIC_INIT(1) }
-- 
2.7.4
