From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH] kallsyms: Fix segfault in prefix_underscores_count().
Date: Fri, 7 Aug 2009 18:22:31 +0900
Message-ID: <20090807092231.GA2199@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:36655 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbZHGJWc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2009 05:22:32 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Lai Jiangshan <laijs@cn.fujitsu.com>, linux-next@vger.kernel.org

As a good indicator that Impact lines are completely useless, commit 
b478b782e110fdb4135caa3062b6d687e989d994 "kallsyms, tracing: output more
proper symbol name" introduces a "bugfix" that introduced segfaults on
several of my defconfigs:

	http://kisskb.ellerman.id.au/kisskb/buildresult/1017849/
	http://kisskb.ellerman.id.au/kisskb/buildresult/1017351/
	http://kisskb.ellerman.id.au/kisskb/buildresult/1017354/

The cause is the introduction of prefix_underscores_count() which
attempts to count underscores.. even in symbols that do not have them.
As a result, it just uselessly runs past the end of the buffer until it
crashes.

This adds a strlen iterator that bails out if nothing is found in the
string, which fixes up the observed segfaults.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>
Cc: Lai Jiangshan <laijs@cn.fujitsu.com>
Cc: Sam Ravnborg <sam@ravnborg.org>

---

I've uploaded the symbol list to:

	http://userweb.kernel.org/~lethal/symbol-list.gz

that one can pipe in to scripts/kallsyms to reproduce the fault in -next,
incase someone wants to come up with a better fix :-)

 scripts/kallsyms.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 64343cc..f1d44b2 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -584,9 +538,14 @@ static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 static int prefix_underscores_count(const char *str)
 {
 	const char *tail = str;
+	size_t len = strlen(str);
+
+	while (*tail != '_') {
+		if (!len--)
+			return 0;
 
-	while (*tail != '_')
 		tail++;
+	}
 
 	return tail - str;
 }
