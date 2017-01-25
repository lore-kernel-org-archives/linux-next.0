From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the selinux tree
Date: Wed, 25 Jan 2017 15:16:54 +1100
Message-ID: <20170125151654.02960975@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751137AbdAYEQ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Jan 2017 23:16:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  security/selinux/hooks.c

between commit:

  be0554c9bf9f ("selinux: clean up cred usage and simplify")

from the selinux tree and commit:

  9227dd2a84a7 ("exec: Remove LSM_UNSAFE_PTRACE_CAP")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc security/selinux/hooks.c
index 0d24eb2325d2,cece6fe55f02..000000000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -2397,9 -2404,8 +2397,8 @@@ static int selinux_bprm_set_creds(struc
  
  		/* Make sure that anyone attempting to ptrace over a task that
  		 * changes its SID has the appropriate permit */
- 		if (bprm->unsafe &
- 		    (LSM_UNSAFE_PTRACE | LSM_UNSAFE_PTRACE_CAP)) {
+ 		if (bprm->unsafe & LSM_UNSAFE_PTRACE) {
 -			u32 ptsid = ptrace_parent_sid(current);
 +			u32 ptsid = ptrace_parent_sid();
  			if (ptsid != 0) {
  				rc = avc_has_perm(ptsid, new_tsec->sid,
  						  SECCLASS_PROCESS,
