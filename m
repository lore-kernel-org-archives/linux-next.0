From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree
Date: Tue, 9 Dec 2008 16:40:26 +1100
Message-ID: <20081209164026.022dfa39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750880AbYLIFkl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 00:40:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Miloslav Trmac <mitr@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>

Hi James,

Today's linux-next merge of the security-testing tree got a conflict in
drivers/char/tty_audit.c between commit
49518720d67042cf431e7f96aed5b0f5c51a84e3 ("[PATCH] Audit: Log TIOCSTI")
from the audit-current tree and commit
66303bce9b924e35e435d35409d3abc371755767 ("CRED: Wrap task credential
accesses in the tty driver") from the security-testing tree.

The former moved the code that the latter was modifying.  I fixed it up
(see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/char/tty_audit.c
index 632c296,d961fa9..0000000
--- a/drivers/char/tty_audit.c
+++ b/drivers/char/tty_audit.c
@@@ -76,11 -82,16 +76,12 @@@ static void tty_audit_log(const char *d
  	ab = audit_log_start(NULL, GFP_KERNEL, AUDIT_TTY);
  	if (ab) {
  		char name[sizeof(tsk->comm)];
+ 		uid_t uid = task_uid(tsk);
  
 -		audit_log_format(ab, "tty pid=%u uid=%u auid=%u ses=%u "
 -				 "major=%d minor=%d comm=",
 +		audit_log_format(ab, "%s pid=%u uid=%u auid=%u ses=%u "
 +				 "major=%d minor=%d comm=", description,
- 				 tsk->pid, tsk->uid, loginuid, sessionid,
+ 				 tsk->pid, uid, loginuid, sessionid,
 -				 buf->major, buf->minor);
 +				 major, minor);
  		get_task_comm(name, tsk);
  		audit_log_untrustedstring(ab, name);
  		audit_log_format(ab, " data=");
