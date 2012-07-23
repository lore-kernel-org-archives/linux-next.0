From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] watchdog: fix watchdog-test.c build warning
Date: Mon, 23 Jul 2012 10:46:11 -0700
Message-ID: <500D8DE3.20104@xenotime.net>
References: <20120723164036.52bc93caafcd165fc16f0284@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:42003 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754158Ab2GWRrL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jul 2012 13:47:11 -0400
In-Reply-To: <20120723164036.52bc93caafcd165fc16f0284@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix compiler warning by making the function static:

Documentation/watchdog/src/watchdog-test.c:34:6: warning: no previous prototype for 'term'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Wim Van Sebroeck <wim@iguana.be>
Cc:	linux-watchdog@vger.kernel.org
---
 Documentation/watchdog/src/watchdog-test.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120723.orig/Documentation/watchdog/src/watchdog-test.c
+++ linux-next-20120723/Documentation/watchdog/src/watchdog-test.c
@@ -31,7 +31,7 @@ static void keep_alive(void)
  * or "-e" to enable the card.
  */
 
-void term(int sig)
+static void term(int sig)
 {
     close(fd);
     fprintf(stderr, "Stopping watchdog ticks...\n");
