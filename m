From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] pstore: fix printk format warning in ram.c
Date: Fri, 15 Jun 2012 12:19:20 -0700
Message-ID: <4FDB8AB8.6060703@xenotime.net>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:48871 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753793Ab2FOTTi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jun 2012 15:19:38 -0400
In-Reply-To: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marco Stornelli <marco.stornelli@gmail.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning (on i386) in pstore:

fs/pstore/ram.c:378:3: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 fs/pstore/ram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120615.orig/fs/pstore/ram.c
+++ linux-next-20120615/fs/pstore/ram.c
@@ -375,7 +375,7 @@ static int __init ramoops_probe(struct p
 		goto fail_init_cprz;
 
 	if (!cxt->przs && !cxt->cprz) {
-		pr_err("memory size too small, minimum is %lu\n",
+		pr_err("memory size too small, minimum is %zu\n",
 			cxt->console_size + cxt->record_size);
 		goto fail_cnt;
 	}
