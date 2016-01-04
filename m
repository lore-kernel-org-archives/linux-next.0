From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the integrity tree with the vfs tree
Date: Mon, 4 Jan 2016 13:52:21 +1100
Message-ID: <20160104135221.0e5515ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59354 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751974AbcADCwY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jan 2016 21:52:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  security/integrity/ima/ima_fs.c

between commit:

  3bc8f29b149e ("new helper: memdup_user_nul()")

from the vfs tree and commit:

  6427e6c71c8b ("ima: ima_write_policy() limit locking")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc security/integrity/ima/ima_fs.c
index a185b6f2f390,f355231997b4..000000000000
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@@ -277,13 -272,25 +272,20 @@@ static ssize_t ima_write_policy(struct 
  	if (*ppos != 0)
  		goto out;
  
 -	result = -ENOMEM;
 -	data = kmalloc(datalen + 1, GFP_KERNEL);
 -	if (!data)
 +	data = memdup_user_nul(buf, datalen);
 +	if (IS_ERR(data)) {
 +		result = PTR_ERR(data);
  		goto out;
 -
 -	*(data + datalen) = '\0';
 -
 -	result = -EFAULT;
 -	if (copy_from_user(data, buf, datalen))
 -		goto out_free;
 +	}
  
+ 	result = mutex_lock_interruptible(&ima_write_mutex);
+ 	if (result < 0)
+ 		goto out_free;
  	result = ima_parse_add_rule(data);
+ 	mutex_unlock(&ima_write_mutex);
+ 
+ out_free:
+ 	kfree(data);
  out:
  	if (result < 0)
  		valid_policy = 0;
