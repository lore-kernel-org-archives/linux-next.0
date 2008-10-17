From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 17 Oct 2008 17:13:50 +1100
Message-ID: <20081017171350.bb82c42a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33681 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991AbYJQGN6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 02:13:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
include/linux/binfmts.h between commits
53112488bebe25c0f5f8a002470046c0fe9a6c61 ("alpha: introduce field 'taso'
into struct linux_binprm") and bf2a9a39639b8b51377905397a5005f444e9a892
("Allow recursion in binfmt_script and binfmt_misc") from Linus' tree and
commit e87a7f7a60e07326cd18987f1d490e42c083792c ("CRED: Make execve()
take advantage of copy-on-write credentials") from the creds tree.

Just context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/binfmts.h
index 7394b5b,26f9c1b..0000000
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@@ -35,16 -35,16 +35,20 @@@ struct linux_binprm
  	struct mm_struct *mm;
  	unsigned long p; /* current top of mem */
  	unsigned int sh_bang:1,
- 		     misc_bang:1;
+ 		misc_bang:1,
+ 		cred_prepared:1,/* true if creds already prepared (multiple
+ 				 * preps happen for interpreters) */
+ 		cap_effective:1;/* true if has elevated effective capabilities,
+ 				 * false if not; except for init which inherits
+ 				 * its parent's caps anyway */
 +#ifdef __alpha__
 +	unsigned int taso:1;
 +#endif
 +	unsigned int recursion_depth;
  	struct file * file;
- 	int e_uid, e_gid;
- 	kernel_cap_t cap_post_exec_permitted;
- 	bool cap_effective;
- 	void *security;
+ 	struct cred *cred;	/* new credentials */
+ 	int unsafe;		/* how unsafe this exec is (mask of LSM_UNSAFE_*) */
+ 	unsigned int per_clear;	/* bits to clear in current->personality */
  	int argc, envc;
  	char * filename;	/* Name of binary as seen by procps */
  	char * interp;		/* Name of the binary really executed. Most
