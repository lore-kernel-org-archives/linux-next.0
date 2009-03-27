From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the lblnet tree with the
 security-testing tree
Date: Fri, 27 Mar 2009 16:19:57 +1100
Message-ID: <20090327161957.2bb234d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33489 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755001AbZC0FUF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Mar 2009 01:20:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Etienne Basset <etienne.basset@numericable.fr>

Hi Paul, James,

Today's linux-next merge of the lblnet tree got a conflict in
security/smack/smack_lsm.c between commit
7198e2eeb44b3fe7cc97f997824002da47a9c644 ("smack: convert smack to
standard linux lists") from the security-testing tree and commits
c5b5a2a5e23a0056c76b2084ae2001e55816778a ("netlabel: Cleanup the
Smack/NetLabel code to fix incoming TCP connections") and
174531a7a4f47f47dd706985d3d5e489fec87ab2 ("smack: Add a new '-CIPSO'
option to the network address label configuration") from the lblnet tree.

I fixed it up (see below - I am not entirely sure it is correct) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/smack/smack_lsm.c
index fd20d15,4f1838b..0000000
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@@ -1295,6 -1302,42 +1300,48 @@@ static void smack_sk_free_security(stru
  }
  
  /**
+ * smack_host_label - check host based restrictions
+ * @sip: the object end
+ *
+ * looks for host based access restrictions
+ *
+ * This version will only be appropriate for really small
+ * sets of single label hosts.
+ *
+ * Returns the label of the far end or NULL if it's not special.
+ */
+ static char *smack_host_label(struct sockaddr_in *sip)
+ {
+ 	struct smk_netlbladdr *snp;
+ 	struct in_addr *siap = &sip->sin_addr;
+ 
+ 	if (siap->s_addr == 0)
+ 		return NULL;
+ 
 -	for (snp = smack_netlbladdrs; snp != NULL; snp = snp->smk_next)
++	rcu_read_lock();
++	list_for_each_entry_rcu(snp, &smk_netlbladdr_list, list) {
+ 		/*
+ 		 * we break after finding the first match because
+ 		 * the list is sorted from longest to shortest mask
+ 		 * so we have found the most specific match
+ 		 */
+ 		if ((&snp->smk_host.sin_addr)->s_addr  ==
+ 			(siap->s_addr & (&snp->smk_mask)->s_addr)) {
+ 			/* we have found the special CIPSO option */
 -			if (snp->smk_label == smack_cipso_option)
++			if (snp->smk_label == smack_cipso_option) {
++				rcu_read_unlock();
+ 				return NULL;
++			}
+ 
++			rcu_read_unlock();
+ 			return snp->smk_label;
+ 		}
++	}
++	rcu_read_unlock();
+ 	return NULL;
+ }
+ 
+ /**
   * smack_set_catset - convert a capset to netlabel mls categories
   * @catset: the Smack categories
   * @sap: where to put the netlabel categories
