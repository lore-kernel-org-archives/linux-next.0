From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: Tree for October 16
Date: Thu, 16 Oct 2008 22:41:18 +0400
Message-ID: <20081016184118.GA19976@x200.localdomain>
References: <20081016211811.a523c8f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:60479 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbYJPSiU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 14:38:20 -0400
Received: by nf-out-0910.google.com with SMTP id d3so85098nfc.21
        for <linux-next@vger.kernel.org>; Thu, 16 Oct 2008 11:38:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081016211811.a523c8f2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, dhowells@redhat.com

on i386-smp-n-debug-n-preempt-n-paravirt-n-mem-01:
cred.h compile fixes.


--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -6,7 +6,7 @@
  * Carnegie Mellon encourages users of this code to contribute improvements
  * to the Coda project. Contact Peter Braam <coda@cs.cmu.edu>.
  */
-
+#include <linux/cred.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/time.h>
diff --git a/fs/nfsctl.c b/fs/nfsctl.c
index cc4ef26..830df68 100644
--- a/fs/nfsctl.c
+++ b/fs/nfsctl.c
@@ -4,6 +4,7 @@
  *	This should eventually move to userland.
  *
  */
+#include <linux/cred.h>
 #include <linux/types.h>
 #include <linux/file.h>
 #include <linux/fs.h>
@@ -13,6 +14,7 @@
 #include <linux/linkage.h>
 #include <linux/namei.h>
 #include <linux/mount.h>
+#include <linux/sched.h>
 #include <linux/syscalls.h>
 #include <asm/uaccess.h>
 
