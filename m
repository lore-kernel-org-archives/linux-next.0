From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 17 Oct 2008 17:08:25 +1100
Message-ID: <20081017170825.7da46c80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45299 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751483AbYJQGIc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 02:08:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/binfmt_elf_fdpic.c between commit
5edc2a5123a7c3d9bcb19ffcf3b91e8d6c246092 ("binfmt_elf_fdpic: wire up
AT_EXECFD, AT_EXECFN, AT_SECURE") from Linus' tree and commit
4865969c64ed7e911fae4e6a275e65789806f823 ("CRED: Wrap current->cred and a
few other accessors") from the creds tree.

Just context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/binfmt_elf_fdpic.c
index 0e8367c,83a55ef..0000000
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@@ -477,9 -465,10 +477,10 @@@ static int create_elf_fdpic_tables(stru
  {
  	unsigned long sp, csp, nitems;
  	elf_caddr_t __user *argv, *envp;
+ 	const struct cred *cred = current_cred();
  	size_t platform_len = 0, len;
 -	char *k_platform;
 -	char __user *u_platform, *p;
 +	char *k_platform, *k_base_platform;
 +	char __user *u_platform, *u_base_platform, *p;
  	long hwcap;
  	int loop;
  	int nr;	/* reset for each csp adjustment */
@@@ -623,12 -587,10 +624,12 @@@
  	NEW_AUX_ENT(AT_BASE,	interp_params->elfhdr_addr);
  	NEW_AUX_ENT(AT_FLAGS,	0);
  	NEW_AUX_ENT(AT_ENTRY,	exec_params->entry_addr);
- 	NEW_AUX_ENT(AT_UID,	(elf_addr_t) current->uid);
- 	NEW_AUX_ENT(AT_EUID,	(elf_addr_t) current->euid);
- 	NEW_AUX_ENT(AT_GID,	(elf_addr_t) current->gid);
- 	NEW_AUX_ENT(AT_EGID,	(elf_addr_t) current->egid);
+ 	NEW_AUX_ENT(AT_UID,	(elf_addr_t) cred->uid);
+ 	NEW_AUX_ENT(AT_EUID,	(elf_addr_t) cred->euid);
+ 	NEW_AUX_ENT(AT_GID,	(elf_addr_t) cred->gid);
+ 	NEW_AUX_ENT(AT_EGID,	(elf_addr_t) cred->egid);
 +	NEW_AUX_ENT(AT_SECURE,	security_bprm_secureexec(bprm));
 +	NEW_AUX_ENT(AT_EXECFN,	bprm->exec);
  
  #ifdef ARCH_DLINFO
  	nr = 0;
