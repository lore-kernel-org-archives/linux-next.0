From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH] sysfs: Don't use enums in inline function declaration.
Date: Wed, 05 May 2010 14:54:00 -0700
Message-ID: <m18w7y10cn.fsf_-_@fess.ebiederm.org>
References: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
	<20100430105016.40b51636.randy.dunlap@oracle.com>
	<20100505091738.7ec27479.randy.dunlap@oracle.com>
	<20100505162459.GA20296@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:41197 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161Ab0EEVyF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 17:54:05 -0400
In-Reply-To: <20100505162459.GA20296@suse.de> (Greg KH's message of "Wed\, 5 May 2010 09\:24\:59 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>


It appears gcc can't cope with using an enum that is only declared in
an inline function declaration, that doesn't even use the variable
that is so declared.

Avoid the silliness and replace the enum with an int, and make gcc
happy.

Signed-off-by: Eric W. Biederman <ebiederm@aristanetworks.com>
---
 include/linux/sysfs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index e58ca1c..17cbeb7 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -318,7 +318,7 @@ static inline void sysfs_put(struct sysfs_dirent *sd)
 {
 }
 
-static inline void sysfs_exit_ns(enum kobj_ns_type type, const void *tag)
+static inline void sysfs_exit_ns(int type, const void *tag)
 {
 }
 
-- 
1.6.6.1
