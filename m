From: Dan Streetman <ddstreet@ieee.org>
Subject: [PATCH] crypto: 842 - remove WARN inside printk
Date: Mon, 21 Dec 2015 12:52:10 -0500
Message-ID: <1450720330-30676-1-git-send-email-ddstreet@ieee.org>
References: <5671C83C.7@infradead.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:33364 "EHLO
	mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965AbbLURw2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 12:52:28 -0500
In-Reply-To: <5671C83C.7@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Haren Myneni <haren@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-crypto@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Dan Streetman <ddstreet@ieee.org>

Remove the WARN() from the beN_to_cpu macro, which is used as a param to a
pr_debug() call.  With a certain kernel config, this printk-in-printk
results in the no_printk() macro trying to recursively call the
no_printk() macro, and since macros can't recursively call themselves
a build error results.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Dan Streetman <ddstreet@ieee.org>
---
 lib/842/842_decompress.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/842/842_decompress.c b/lib/842/842_decompress.c
index 8881dad..a7f278d 100644
--- a/lib/842/842_decompress.c
+++ b/lib/842/842_decompress.c
@@ -69,7 +69,7 @@ struct sw842_param {
 	((s) == 2 ? be16_to_cpu(get_unaligned((__be16 *)d)) :	\
 	 (s) == 4 ? be32_to_cpu(get_unaligned((__be32 *)d)) :	\
 	 (s) == 8 ? be64_to_cpu(get_unaligned((__be64 *)d)) :	\
-	 WARN(1, "pr_debug param err invalid size %x\n", s))
+	 0)
 
 static int next_bits(struct sw842_param *p, u64 *d, u8 n);
 
@@ -202,10 +202,14 @@ static int __do_index(struct sw842_param *p, u8 size, u8 bits, u64 fsize)
 		return -EINVAL;
 	}
 
-	pr_debug("index%x to %lx off %lx adjoff %lx tot %lx data %lx\n",
-		 size, (unsigned long)index, (unsigned long)(index * size),
-		 (unsigned long)offset, (unsigned long)total,
-		 (unsigned long)beN_to_cpu(&p->ostart[offset], size));
+	if (size != 2 && size != 4 && size != 8)
+		WARN(1, "__do_index invalid size %x\n", size);
+	else
+		pr_debug("index%x to %lx off %lx adjoff %lx tot %lx data %lx\n",
+			 size, (unsigned long)index,
+			 (unsigned long)(index * size), (unsigned long)offset,
+			 (unsigned long)total,
+			 (unsigned long)beN_to_cpu(&p->ostart[offset], size));
 
 	memcpy(p->out, &p->ostart[offset], size);
 	p->out += size;
-- 
2.5.0
