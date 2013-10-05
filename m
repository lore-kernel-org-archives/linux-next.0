From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted buffer.
Date: Sat, 05 Oct 2013 23:50:39 +0800
Message-ID: <5250354F.4020506@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:9438 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752629Ab3JEPvk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Oct 2013 11:51:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, athorlton@sgi.com, Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

sizeof("Tainted: ") already counts '\0', and after first sprintf(), 's'
will start from the current string end (its' value is '\0').

So need not add additional 1 byte for maximized usage of 'buf' in
print_tainted().


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 kernel/panic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index b6c482c..c00b4ce 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -233,7 +233,7 @@ static const struct tnt tnts[] = {
  */
 const char *print_tainted(void)
 {
-	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ") + 1];
+	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ")];
 
 	if (tainted_mask) {
 		char *s;
-- 
1.7.7.6
