From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: net tree build failure
Date: Wed, 20 May 2009 07:53:21 -0700
Message-ID: <m1d4a3keqm.fsf@fess.ebiederm.org>
References: <20090521001928.4bf71911.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:39867 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412AbZETOx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 10:53:26 -0400
In-Reply-To: <20090521001928.4bf71911.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Thu\, 21 May 2009 00\:19\:28 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Haavard Skinnemoen <hskinnemoen@atmel.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Dave,
>
> Today's linux-next build of at least some av32 and arm configs failed like this:
>
> arch/avr32/kernel/signal.c:216: error: conflicting types for 'restart_syscall'
> include/linux/sched.h:2184: error: previous definition of 'restart_syscall' was here
>
> Caused by commit 690cc3ffe33ac4a2857583c22d4c6244ae11684d ("syscall:
> Implement a convinience function restart_syscall") from the net tree.
>
> grep is your friend ...

Grrr. Some days it feels like all of the good names are already taken.

How does this look for a solution to the name clash?


---

diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 80b8b5c..88a8f0b 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -532,7 +532,7 @@ setup_rt_frame(int usig, struct k_sigaction *ka, siginfo_t *info,
 	return err;
 }
 
-static inline void restart_syscall(struct pt_regs *regs)
+static inline void setup_syscall_restart(struct pt_regs *regs)
 {
 	regs->ARM_r0 = regs->ARM_ORIG_r0;
 	regs->ARM_pc -= thumb_mode(regs) ? 2 : 4;
@@ -567,7 +567,7 @@ handle_signal(unsigned long sig, struct k_sigaction *ka,
 			}
 			/* fallthrough */
 		case -ERESTARTNOINTR:
-			restart_syscall(regs);
+			setup_syscall_restart(regs);
 		}
 	}
 
diff --git a/arch/avr32/kernel/signal.c b/arch/avr32/kernel/signal.c
index 803d7be..2722756 100644
--- a/arch/avr32/kernel/signal.c
+++ b/arch/avr32/kernel/signal.c
@@ -212,7 +212,7 @@ out:
 	return err;
 }
 
-static inline void restart_syscall(struct pt_regs *regs)
+static inline void setup_syscall_restart(struct pt_regs *regs)
 {
 	if (regs->r12 == -ERESTART_RESTARTBLOCK)
 		regs->r8 = __NR_restart_syscall;
@@ -296,7 +296,7 @@ int do_signal(struct pt_regs *regs, sigset_t *oldset, int syscall)
 			}
 			/* fall through */
 		case -ERESTARTNOINTR:
-			restart_syscall(regs);
+			setup_syscall_restart(regs);
 		}
 	}
