From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 6 Oct 2015 13:55:01 +1100
Message-ID: <20151006135501.2d8bbb5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Vander Stoep <jeffv@google.com>, Paul Moore <pmoore@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  include/linux/lsm_audit.h

between commit:

  671a2781ff01 ("security: add ioctl specific auditing to lsm_audit")

from Linus' tree and commit:

  43cfd5e38587 ("audit: constify parts of common_audit_data and lsm_network_audit")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/lsm_audit.h
index ffb9c9da4f39,6c4c7acd0e5e..000000000000
--- a/include/linux/lsm_audit.h
+++ b/include/linux/lsm_audit.h
@@@ -58,10 -53,9 +58,10 @@@ struct common_audit_data 
  #define LSM_AUDIT_DATA_KMOD	8
  #define LSM_AUDIT_DATA_INODE	9
  #define LSM_AUDIT_DATA_DENTRY	10
 +#define LSM_AUDIT_DATA_IOCTL_OP	11
  	union 	{
  		struct path path;
- 		struct dentry *dentry;
+ 		const struct dentry *dentry;
  		struct inode *inode;
  		struct lsm_network_audit *net;
  		int cap;
@@@ -70,11 -64,10 +70,11 @@@
  #ifdef CONFIG_KEYS
  		struct {
  			key_serial_t key;
- 			char *key_desc;
+ 			const char *key_desc;
  		} key_struct;
  #endif
- 		char *kmod_name;
+ 		const char *kmod_name;
 +		struct lsm_ioctlop_audit *op;
  	} u;
  	/* this union contains LSM specific data */
  	union {
