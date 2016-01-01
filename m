From: Petko Manolov <petkan@mip-labs.com>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Fri, 1 Jan 2016 19:29:37 +0200
Message-ID: <20160101172937.GD13634@localhost>
References: <20151231152453.08cfae79@canb.auug.org.au>
 <20151231043019.GD9938@ZenIV.linux.org.uk>
 <20151231104535.GA5555@localhost>
 <20160101043416.GE9938@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lan.nucleusys.com ([92.247.61.126]:53530 "EHLO
	zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752013AbcAAR3M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jan 2016 12:29:12 -0500
Content-Disposition: inline
In-Reply-To: <20160101043416.GE9938@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

On 16-01-01 04:34:16, Al Viro wrote:
> On Thu, Dec 31, 2015 at 12:45:35PM +0200, Petko Manolov wrote:
> 
> > I introduced the write mutex when ima_write_policy() stopped being serialized by 
> > other means.  Come to think about it the semaphore could be taken right before 
> > copy_from_user() so it is my fault, not Stephen's.
> 
> s/before/after/, surely?

Right.  This is a quick patch which i hope solves most issues...


		Petko


>From 6c9058009c59fda5b8e98a3fc09497ce3efdb3e9 Mon Sep 17 00:00:00 2001
From: Petko Manolov <petkan@mip-labs.com>
Date: Fri, 1 Jan 2016 19:10:43 +0200
Subject: [PATCH] ima_write_policy() optimizations;

There is no need to hold the write semaphore for so long.  We only need it
around ima_parse_add_rule();

The return path now takes into account failed kmalloc() call.

Signed-off-by: Petko Manolov <petkan@mip-labs.com>
---
 security/integrity/ima/ima_fs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index 3caed6d..d2c0d55 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -261,13 +261,7 @@ static const struct file_operations ima_ascii_measurements_ops = {
 static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 				size_t datalen, loff_t *ppos)
 {
-	char *data = NULL;
 	ssize_t result;
-	int res;
-
-	res = mutex_lock_interruptible(&ima_write_mutex);
-	if (res)
-		return res;
 
 	if (datalen >= PAGE_SIZE)
 		datalen = PAGE_SIZE - 1;
@@ -286,15 +280,21 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 
 	result = -EFAULT;
 	if (copy_from_user(data, buf, datalen))
-		goto out;
+		goto out_free;
+
+	result = mutex_lock_interruptible(&ima_write_mutex);
+	if (result)
+		goto out_free;
 
 	result = ima_parse_add_rule(data);
-out:
+
+	mutex_unlock(&ima_write_mutex);
+
 	if (result < 0)
 		valid_policy = 0;
+out_free:
 	kfree(data);
-	mutex_unlock(&ima_write_mutex);
-
+out:
 	return result;
 }
 
-- 
2.6.4
