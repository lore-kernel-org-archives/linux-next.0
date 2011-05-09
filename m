From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (driver-core tree related)
Date: Tue, 10 May 2011 01:18:22 +0200
Message-ID: <1304983104.1351.17.camel@zag>
References: <20110509145854.9e6d8806.sfr@canb.auug.org.au>
	 <BANLkTinzFs0cfGdmkdOE8cgKSHK=5NEjmg@mail.gmail.com>
	 <201105100019.52936.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:43569 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755115Ab1EIXSm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2011 19:18:42 -0400
In-Reply-To: <201105100019.52936.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Guda <atu@dmeti.dp.ua>

On Tue, 2011-05-10 at 00:19 +0200, Rafael J. Wysocki wrote:
> On Monday, May 09, 2011, Kay Sievers wrote:
> > On Mon, May 9, 2011 at 06:58, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > After merging the final tree, today's linux-next build (powerpc allnoconfig)
> > > failed like this:
> > >
> > > kernel/sys.c: In function 'kernel_restart_prepare':
> > > kernel/sys.c:317: error: implicit declaration of function 'usermodehelper_disable'
> > 
> > Rafael, seems usermodehelper_disable() depends on CONFIG_PM_SLEEP.
> > 
> > Any reason for that conditional? Remove it now?
> 
> Aw, we have two conflicting changes.  Could you prepare a patch on top of:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git pm-next
> 
> removing that #ifdef?  That needs to be done in kmod.h too.

Like this?

Thanks,
Kay


From: Kay Sievers <kay.sievers@vrfy.org>
Subject: kmod: always provide usermodehelper_disable()

We need to prevent kernel-forked processes during system poweroff.
Such processes try to access the filesystem whose disks we are
trying to shutdown at the same time. This causes delays and exceptions
in the storage drivers.

A follow-up patch will add these calls and need usermodehelper_disable()
also on systems without suspend support.

Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
---

diff --git a/include/linux/kmod.h b/include/linux/kmod.h
index 7f3dbcb..3102318 100644
--- a/include/linux/kmod.h
+++ b/include/linux/kmod.h
@@ -111,12 +111,8 @@ call_usermodehelper(char *path, char **argv, char **envp, enum umh_wait wait)
 
 extern void usermodehelper_init(void);
 
-#ifdef CONFIG_PM_SLEEP
 extern int usermodehelper_disable(void);
 extern void usermodehelper_enable(void);
 extern bool usermodehelper_is_disabled(void);
-#else
-static inline bool usermodehelper_is_disabled(void) { return false; }
-#endif
 
 #endif /* __LINUX_KMOD_H__ */
diff --git a/kernel/kmod.c b/kernel/kmod.c
index 9ab513b..5ae0ff3 100644
--- a/kernel/kmod.c
+++ b/kernel/kmod.c
@@ -245,7 +245,6 @@ static void __call_usermodehelper(struct work_struct *work)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * If set, call_usermodehelper_exec() will exit immediately returning -EBUSY
  * (used for preventing user land processes from being created after the user
@@ -321,12 +320,6 @@ static void helper_unlock(void)
 	if (atomic_dec_and_test(&running_helpers))
 		wake_up(&running_helpers_waitq);
 }
-#else /* CONFIG_PM_SLEEP */
-#define usermodehelper_disabled	0
-
-static inline void helper_lock(void) {}
-static inline void helper_unlock(void) {}
-#endif /* CONFIG_PM_SLEEP */
 
 /**
  * call_usermodehelper_setup - prepare to call a usermode helper
