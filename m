From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Thu, 16 Oct 2008 20:28:56 +1100
Message-ID: <20081016202856.3dcaeac7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50158 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753526AbYJPKeQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 06:34:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: linux-next@vger.kernel.org

Hi Eric,

Today's linux-next build (powerpc allyesconfig) failed like this:

net/9p/client.c: At top level:
net/9p/client.c:698: error: __ksymtab_p9_client_version causes a section type conflict

Caused by commit f0cad54013b07371dcefd8fa36ff1d3918b49695 ("9p: rework
client code to use new protocol support functions") from the v9fs tree
which exported a static function.  I have applied the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 16 Oct 2008 20:27:24 +1100
Subject: [PATCH] v9fs: don't export static functions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/9p/client.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index 4cd9e70..7621fe8 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -655,7 +655,7 @@ static void p9_fid_destroy(struct p9_fid *fid)
 	kfree(fid);
 }
 
-static int p9_client_version(struct p9_client *c)
+int p9_client_version(struct p9_client *c)
 {
 	int err = 0;
 	struct p9_req_t *req;
-- 
1.5.6.5
