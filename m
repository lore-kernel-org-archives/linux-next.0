From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fscrypt tree with Linus' tree
Date: Mon, 20 Mar 2017 10:17:49 +1100
Message-ID: <20170320101749.721456cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752143AbdCSXeE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Mar 2017 19:34:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, James Morris <james.l.morris@oracle.com>, Eric Biggers <ebiggers@google.com>

Hi Ted,

Today's linux-next merge of the fscrypt tree got a conflict in:

  fs/crypto/keyinfo.c

between commit:

  0837e49ab3fa ("KEYS: Differentiate uses of rcu_dereference_key() and user_key_payload()")

from Linus' tree and commit:

  1b53cf9815bb ("fscrypt: remove broken support for detecting keyring key revocation")

from the fscrypt tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/crypto/keyinfo.c
index d5d896fa5a71,cb3e82abf034..000000000000
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@@ -102,11 -103,9 +103,9 @@@ static int validate_user_key(struct fsc
  		res = -ENOKEY;
  		goto out;
  	}
- 	down_read(&keyring_key->sem);
 -	ukp = user_key_payload(keyring_key);
 +	ukp = user_key_payload_locked(keyring_key);
  	if (ukp->datalen != sizeof(struct fscrypt_key)) {
  		res = -EINVAL;
- 		up_read(&keyring_key->sem);
  		goto out;
  	}
  	master_key = (struct fscrypt_key *)ukp->data;
