From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security tree with the vfs tree
Date: Thu, 31 Dec 2015 15:24:53 +1100
Message-ID: <20151231152453.08cfae79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44931 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752587AbbLaEYy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 23:24:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>

Hi James,

Today's linux-next merge of the security tree got a conflict in:

  security/integrity/ima/ima_fs.c

between commit:

  3bc8f29b149e ("new helper: memdup_user_nul()")

from the vfs tree and commit:

  38d859f991f3 ("IMA: policy can now be updated multiple times")

from the security tree.

I fixed it up (hopefully, see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc security/integrity/ima/ima_fs.c
index 71aa60b8d257,3caed6de610c..000000000000
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@@ -259,21 -261,35 +261,30 @@@ static const struct file_operations ima
  static ssize_t ima_write_policy(struct file *file, const char __user *buf,
  				size_t datalen, loff_t *ppos)
  {
 -	char *data = NULL;
  	ssize_t result;
- 	char *data;
++	char *data = NULL;
+ 	int res;
+ 
+ 	res = mutex_lock_interruptible(&ima_write_mutex);
+ 	if (res)
+ 		return res;
  
  	if (datalen >= PAGE_SIZE)
  		datalen = PAGE_SIZE - 1;
  
  	/* No partial writes. */
+ 	result = -EINVAL;
  	if (*ppos != 0)
- 		return -EINVAL;
+ 		goto out;
  
 -	result = -ENOMEM;
 -	data = kmalloc(datalen + 1, GFP_KERNEL);
 -	if (!data)
 -		goto out;
 -
 -	*(data + datalen) = '\0';
 -
 -	result = -EFAULT;
 -	if (copy_from_user(data, buf, datalen))
 +	data = memdup_user_nul(buf, datalen);
- 	if (IS_ERR(data))
- 		return PTR_ERR(data);
++	if (IS_ERR(data)) {
++		result = PTR_ERR(data);
+ 		goto out;
++	}
  
  	result = ima_parse_add_rule(data);
+ out:
  	if (result < 0)
  		valid_policy = 0;
  	kfree(data);
