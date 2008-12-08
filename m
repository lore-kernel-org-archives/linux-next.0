From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the lblnet tree
Date: Mon, 8 Dec 2008 19:07:08 +1100
Message-ID: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37717 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbYLHIHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 03:07:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>

Hi Paul,

Today's linux-next merge of the lblnet tree got a conflicts in
security/smack/smack_lsm.c and security/smack/smackfs.c between commits
86a264abe542cfececb4df129bc45a0338d8cdb9 ("CRED: Wrap current->cred and a
few other accessors") and d84f4f992cbd76e8f39c488cf0c5d123843923b1
("CRED: Inaugurate COW credentials") from the security-testing tree and
commit d936691ab765fbac809e9a05c7f0c36ce2c2119e ("smack: Add support for
unlabeled network hosts and networks") from the lblnet tree.

I fixed it up (see below) and can carry the fixes as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/smack/smack_lsm.c
index 8ad4816,06471e8..0000000
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@@ -2100,11 -2181,13 +2226,17 @@@ static int smack_setprocattr(struct tas
  	if (newsmack == NULL)
  		return -EINVAL;
  
+ 	/*
+ 	 * No process is ever allowed the web ("@") label.
+ 	 */
+ 	if (newsmack == smack_known_web.smk_known)
+ 		return -EPERM;
+ 
 -	p->security = newsmack;
 +	new = prepare_creds();
 +	if (!new)
 +		return -ENOMEM;
 +	new->security = newsmack;
 +	commit_creds(new);
  	return size;
  }
  
@@@ -2337,10 -2488,11 +2537,10 @@@ static void smack_sock_graft(struct soc
  		return;
  
  	ssp = sk->sk_security;
 -	ssp->smk_in = current->security;
 -	ssp->smk_out = current->security;
 +	ssp->smk_in = ssp->smk_out = current_security();
  	ssp->smk_packet[0] = '\0';
  
- 	rc = smack_netlabel(sk);
+ 	rc = smack_netlabel(sk, SMACK_CIPSO_SOCKET);
  	if (rc != 0)
  		printk(KERN_WARNING "Smack: \"%s\" netlbl error %d.\n",
  		       __func__, -rc);
diff --cc security/smack/smackfs.c
index ca257df,a75013f..0000000
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@@ -104,6 -107,24 +107,24 @@@ struct smk_list_entry *smack_list
  #define SMK_ACCESSLEN (sizeof(SMK_ACCESS) - 1)
  #define SMK_LOADLEN   (SMK_LABELLEN + SMK_LABELLEN + SMK_ACCESSLEN)
  
+ /**
+  * smk_netlabel_audit_set - fill a netlbl_audit struct
+  * @nap: structure to fill
+  */
+ static void smk_netlabel_audit_set(struct netlbl_audit *nap)
+ {
+ 	nap->loginuid = audit_get_loginuid(current);
+ 	nap->sessionid = audit_get_sessionid(current);
 -	nap->secid = smack_to_secid(current->security);
++	nap->secid = smack_to_secid(current_security());
+ }
+ 
+ /*
+  * Values for parsing single label host rules
+  * "1.2.3.4 X"
+  * "192.168.138.129/32 abcdefghijklmnopqrstuvw"
+  */
+ #define SMK_NETLBLADDRMIN	9
+ #define SMK_NETLBLADDRMAX	42
  
  /*
   * Seq_file read operations for /smack/load
