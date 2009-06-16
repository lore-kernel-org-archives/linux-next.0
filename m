From: Suresh Jayaraman <sjayaraman@suse.de>
Subject: [PATCH] cifs: Fix build warning in dns_resolve.c
Date: Tue, 16 Jun 2009 14:58:18 +0530
Message-ID: <4A3765B2.10006@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:41184 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756827AbZFPJ2o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2009 05:28:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-next@vger.kernel.org, "linux-cifs-client@lists.samba.org" <linux-cifs-client@lists.samba.org>
Cc: Jeff Layton <jlayton@redhat.com>

Fix a build warning in dns_resolve.c.

fs/cifs/dns_resolve.c: In function 'is_ip':
fs/cifs/dns_resolve.c:42: warning: passing argument 1 of 'cifs_convert_address' discards qualifiers from pointer target type

Signed-off-by: Suresh Jayaraman <sjayaraman@suse.de>
---
 fs/cifs/cifsproto.h |    2 +-
 fs/cifs/netmisc.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/cifsproto.h b/fs/cifs/cifsproto.h
index c419416..53267a3 100644
--- a/fs/cifs/cifsproto.h
+++ b/fs/cifs/cifsproto.h
@@ -74,7 +74,7 @@ extern unsigned int smbCalcSize(struct smb_hdr *ptr);
 extern unsigned int smbCalcSize_LE(struct smb_hdr *ptr);
 extern int decode_negTokenInit(unsigned char *security_blob, int length,
 			enum securityEnum *secType);
-extern int cifs_convert_address(char *src, void *dst);
+extern int cifs_convert_address(const char *src, void *dst);
 extern int map_smb_to_linux_error(struct smb_hdr *smb, int logErr);
 extern void header_assemble(struct smb_hdr *, char /* command */ ,
 			    const struct cifsTconInfo *, int /* length of
diff --git a/fs/cifs/netmisc.c b/fs/cifs/netmisc.c
index f9a54da..390ef00 100644
--- a/fs/cifs/netmisc.c
+++ b/fs/cifs/netmisc.c
@@ -163,7 +163,7 @@ cifs_inet_pton(const int address_family, const char *cp, void *dst)
  * Returns 0 on failure.
  */
 int
-cifs_convert_address(char *src, void *dst)
+cifs_convert_address(const char *src, void *dst)
 {
 	struct sockaddr_in *s4 = (struct sockaddr_in *) dst;
 	struct sockaddr_in6 *s6 = (struct sockaddr_in6 *) dst;
