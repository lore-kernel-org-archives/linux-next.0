From: David Howells <dhowells@redhat.com>
Subject: [PATCH] KEYS: Fix default security_session_to_parent()
Date: Mon, 07 Sep 2009 13:24:17 +0100
Message-ID: <20090907122417.754.63235.stgit@warthog.procyon.org.uk>
References: <20090907203857.023912f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:22560 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753005AbZIGMZN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 08:25:13 -0400
In-Reply-To: <20090907203857.023912f8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jmorris@namei.org, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix the default security_session_to_parent() in linux/security.h to have a
body.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/security.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)


diff --git a/include/linux/security.h b/include/linux/security.h
index f4eb32d..10a0925 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -2988,7 +2988,10 @@ static inline int security_key_getsecurity(struct key *key, char **_buffer)
 
 static inline int security_key_session_to_parent(const struct cred *cred,
 						 const struct cred *parent_cred,
-						 struct key *key);
+						 struct key *key)
+{
+	return 0;
+}
 
 #endif
 #endif /* CONFIG_KEYS */
