From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] GRE: Use strlcat() for size checking
Date: Wed, 27 Mar 2013 19:48:31 +0100
Message-ID: <1364410111-29418-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:39196 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753403Ab3C0Sst (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Mar 2013 14:48:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pravin B Shelar <pshelar@nicira.com>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On m68k, gcc tries to be smart and turns

    strncat(name, "%d", 2);

into a call to strlen() and a 16-bit store, causing a link failure,
as arch/m68k/include/asm/string.h provides strlen() using a macro:

    ERROR: "strlen" [net/ipv4/ip_tunnel.ko] undefined!

Use strlcat() instead to avoid this, which also allows to simplify the
check for buffer overflows.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
--
Compile-tested only

http://kisskb.ellerman.id.au/kisskb/buildresult/8462108/
---
 net/ipv4/ip_tunnel.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 9d96b68..8dbe672 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -284,12 +284,11 @@ static struct net_device *__ip_tunnel_create(struct net *net,
 	if (parms->name[0])
 		strlcpy(name, parms->name, IFNAMSIZ);
 	else {
-		if (strlen(ops->kind) + 3 >= IFNAMSIZ) {
+		strlcpy(name, ops->kind, IFNAMSIZ);
+		if (strlcat(name, "%d", IFNAMSIZ) >= IFNAMSIZ) {
 			err = -E2BIG;
 			goto failed;
 		}
-		strlcpy(name, ops->kind, IFNAMSIZ);
-		strncat(name, "%d", 2);
 	}
 
 	ASSERT_RTNL();
-- 
1.7.0.4
