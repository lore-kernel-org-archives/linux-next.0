From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security tree with the ext4 tree
Date: Sun, 1 Nov 2015 22:12:06 +1100
Message-ID: <20151101221206.1e7c3503@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59533 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752382AbbKALMJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 06:12:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

Hi James,

Today's linux-next merge of the security tree got a conflict in:

  fs/ext4/crypto_key.c

between commit:

  687c3c36e754 ("ext4 crypto: replace some BUG_ON()'s with error checks")

from the ext4 tree and commit:

  146aa8b1453b ("KEYS: Merge the type-specific data with the payload data")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/crypto_key.c
index f9270ec2a132,5c52c79dea46..000000000000
--- a/fs/ext4/crypto_key.c
+++ b/fs/ext4/crypto_key.c
@@@ -207,13 -208,8 +207,13 @@@ retry
  		goto out;
  	}
  	crypt_info->ci_keyring_key = keyring_key;
 -	BUG_ON(keyring_key->type != &key_type_logon);
 +	if (keyring_key->type != &key_type_logon) {
 +		printk_once(KERN_WARNING
 +			    "ext4: key type must be logon\n");
 +		res = -ENOKEY;
 +		goto out;
 +	}
- 	ukp = ((struct user_key_payload *)keyring_key->payload.data);
+ 	ukp = user_key_payload(keyring_key);
  	if (ukp->datalen != sizeof(struct ext4_encryption_key)) {
  		res = -EINVAL;
  		goto out;
