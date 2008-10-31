From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 16:47:08 +1100
Message-ID: <20081031164708.fd0bfba5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37010 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752464AbYJaGL6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 02:11:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>, Theodore Ts'o <tytso@mit.edu>

Hi David,

Today's linux-next merge of the creds tree got conflicts in
fs/ext4/balloc.c between commits 8c3bf8a01c005385e9be0bc992e10abfb355278c
("merge ext4_claim_free_blocks & ext4_has_free_blocks") and
a996031c87e093017c0763326a08896a3a4817f4 ("delay capable() check in
ext4_has_free_blocks()") from the ext4 tree and commit
e6396a30cfa855ccca8cc21bcd92bb40ed10619f ("CRED: Wrap task credential
accesses in the Ext4 filesystem") from the creds tree.

Overlapping change/move of code.  I fixed it up (see below) and can carry
the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/ext4/balloc.c
index 9ce2fcd,5ede818..0000000
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@@ -618,19 -616,14 +618,19 @@@ int ext4_has_free_blocks(struct ext4_sb
  		}
  	}
  	/* Check whether we have space after
 -	 * accounting for current dirty blocks
 +	 * accounting for current dirty blocks & root reserved blocks.
  	 */
 -	if (free_blocks < ((root_blocks + nblocks) + dirty_blocks))
 -		/* we don't have free space */
 -		return -ENOSPC;
 +	if (free_blocks >= ((root_blocks + nblocks) + dirty_blocks))
 +		return 1;
 +
 +	/* Hm, nope.  Are (enough) root reserved blocks available? */
- 	if (sbi->s_resuid == current->fsuid ||
++	if (sbi->s_resuid == current_fsuid() ||
 +	    ((sbi->s_resgid != 0) && in_group_p(sbi->s_resgid)) ||
 +	    capable(CAP_SYS_RESOURCE)) {
 +		if (free_blocks >= (nblocks + dirty_blocks))
 +			return 1;
 +	}
  
 -	/* Add the blocks to nblocks */
 -	percpu_counter_add(dbc, nblocks);
  	return 0;
  }
  
