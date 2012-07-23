From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] pstore: fix printk format warning
Date: Mon, 23 Jul 2012 16:58:31 -0700
Message-ID: <500DE527.1030309@xenotime.net>
References: <20120723164036.52bc93caafcd165fc16f0284@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:41116 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754681Ab2GWX7b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jul 2012 19:59:31 -0400
In-Reply-To: <20120723164036.52bc93caafcd165fc16f0284@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Stornelli <marco.stornelli@gmail.com>, Kees Cook <keescook@chromium.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning (on i386) in pstore:

fs/pstore/ram.c:409:3: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Acked-by: Kees Cook <keescook@chromium.org>
---
This patch from June 15 is still needed in linux-next.

 fs/pstore/ram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120723.orig/fs/pstore/ram.c
+++ linux-next-20120723/fs/pstore/ram.c
@@ -406,7 +406,7 @@ static int __devinit ramoops_probe(struc
 		goto fail_init_fprz;
 
 	if (!cxt->przs && !cxt->cprz && !cxt->fprz) {
-		pr_err("memory size too small, minimum is %lu\n",
+		pr_err("memory size too small, minimum is %zu\n",
 			cxt->console_size + cxt->record_size +
 			cxt->ftrace_size);
 		goto fail_cnt;
