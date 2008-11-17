From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree
Date: Mon, 17 Nov 2008 15:44:10 +1100
Message-ID: <20081117154410.dc25a2d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755878AbYKQEoR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 23:44:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>, Steve French <sfrench@us.ibm.com>, David Howells <dhowells@redhat.com>

Hi James,

Today's linux-next merge of the security-testing tree got a conflict in
fs/cifs/misc.c between commit 14fbf50d695207754daeb96270b3027a3821121f
("cifs: reinstate sharing of SMB sessions sans races") from the cifs tree
and commit a001e5b558f25eb1e588522d73ac949b643b7a37 ("CRED: Wrap task
credential accesses in the CIFS filesystem") from the security-testing
tree.

I fixed it up (see below) and can carry it for a short while.

Steve, you should apply the patch from the security-testing (creds) tree
that was sent to you - its dependencies are upstream already.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

2343ec9bd0c5c15a77e7261355dc93a075e8f753
diff --cc fs/cifs/misc.c
index 46c8c7b,ec36410..1913b65
--- a/fs/cifs/misc.c
+++ b/fs/cifs/misc.c
@@@ -343,13 -347,13 +343,13 @@@ header_assemble(struct smb_hdr *buffer
  		/*  BB Add support for establishing new tCon and SMB Session  */
  		/*      with userid/password pairs found on the smb session   */
  		/*	for other target tcp/ip addresses 		BB    */
- 				if (current->fsuid != treeCon->ses->linux_uid) {
+ 				if (current_fsuid() != treeCon->ses->linux_uid) {
  					cFYI(1, ("Multiuser mode and UID "
  						 "did not match tcon uid"));
 -					read_lock(&GlobalSMBSeslock);
 -					list_for_each(temp_item, &GlobalSMBSessionList) {
 -						ses = list_entry(temp_item, struct cifsSesInfo, cifsSessionList);
 +					read_lock(&cifs_tcp_ses_lock);
 +					list_for_each(temp_item, &treeCon->ses->server->smb_ses_list) {
 +						ses = list_entry(temp_item, struct cifsSesInfo, smb_ses_list);
- 						if (ses->linux_uid == current->fsuid) {
+ 						if (ses->linux_uid == current_fsuid()) {
  							if (ses->server == treeCon->ses->server) {
  								cFYI(1, ("found matching uid substitute right smb_uid"));
  								buffer->Uid = ses->Suid;
