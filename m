From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the proc tree with the security-testing
 tree
Date: Tue, 20 Jan 2009 16:05:27 +1100
Message-ID: <20090120160527.197dc58a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50055 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750712AbZATFFd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 00:05:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, "David P. Quigley" <dpquigl@tycho.nsa.gov>, James Morris <jmorris@namei.org>

Hi Alexey,

Today's linux-next merge of the proc tree got a conflict in
security/selinux/hooks.c between commit
0d90a7ec48c704025307b129413bc62451b20ab3 ("SELinux: Condense super block
security structure flags and cleanup necessary code") from the
security-testing tree and commit c0f23e402155f510dd27d05b4f8d3c0a967dbf69
("proc 3/6: make /proc/net it's own filesystem") from the proc tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.

P.S. James, your email address in the SOB line and committer info of that
securty-testing commit is not very useful ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/selinux/hooks.c
index 3bb4942,38c88e1..0000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -714,11 -698,12 +714,12 @@@ static int selinux_set_mnt_opts(struct 
  		goto out;
  	}
  
- 	if (strcmp(sb->s_type->name, "proc") == 0)
+ 	/* "proc", "proc/net" */
+ 	if (strncmp(sb->s_type->name, "proc", 4) == 0)
 -		sbsec->proc = 1;
 +		sbsec->flags |= SE_SBPROC;
  
  	/* Determine the labeling behavior to use for this filesystem type. */
 -	rc = security_fs_use(sbsec->proc ? "proc" : sb->s_type->name, &sbsec->behavior, &sbsec->sid);
 +	rc = security_fs_use((sbsec->flags & SE_SBPROC) ? "proc" : sb->s_type->name, &sbsec->behavior, &sbsec->sid);
  	if (rc) {
  		printk(KERN_WARNING "%s: security_fs_use(%s) returned %d\n",
  		       __func__, sb->s_type->name, rc);
