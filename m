From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: [PATCH] integrity: ima scatterlist bug fix
Date: Thu, 19 Feb 2009 21:23:50 -0500
Message-ID: <1235096630-3099-1-git-send-email-zohar@linux.vnet.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:33422 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751189AbZBTCYL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 21:24:11 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e7.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n1K2G52L015165
	for <linux-next@vger.kernel.org>; Thu, 19 Feb 2009 21:16:05 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id n1K2OAQa192318
	for <linux-next@vger.kernel.org>; Thu, 19 Feb 2009 21:24:10 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n1K2O9aX032264
	for <linux-next@vger.kernel.org>; Thu, 19 Feb 2009 21:24:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Alexander Beregalov <a.beregalov@gmail.com>, David Safford <safford@watson.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Mimi Zohar <zohar@us.ibm.com>

Based on Alexander Beregalov's post http://lkml.org/lkml/2009/2/19/198

- replaced sg_set_buf() with sg_init_one()

 kernel BUG at include/linux/scatterlist.h:65!
 invalid opcode: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
 last sysfs file:
 CPU 2
 Modules linked in:
 Pid: 1, comm: swapper Not tainted 2.6.29-rc5-next-20090219 #5 PowerEdge 1950
 RIP: 0010:[<ffffffff8045ec70>]  [<ffffffff8045ec70>] ima_calc_hash+0xc0/0x160
 RSP: 0018:ffff88007f46bc40  EFLAGS: 00010286
 RAX: ffffe200032c45e8 RBX: 00000000fffffff4 RCX: 0000000087654321
 RDX: 0000000000000002 RSI: 0000000000000001 RDI: ffff88007cf71048
 RBP: ffff88007f46bcd0 R08: 0000000000000000 R09: 0000000000000163
 R10: ffff88007f4707a8 R11: 0000000000000000 R12: ffff88007cf71048
 R13: 0000000000001000 R14: 0000000000000000 R15: 0000000000009d98
 FS:  0000000000000000(0000) GS:ffff8800051ac000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
 CR2: 0000000000000000 CR3: 0000000000201000 CR4: 00000000000006e0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400

Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
---
 security/integrity/ima/ima_crypto.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/integrity/ima/ima_crypto.c b/security/integrity/ima/ima_crypto.c
index c2a46e4..50d572b 100644
--- a/security/integrity/ima/ima_crypto.c
+++ b/security/integrity/ima/ima_crypto.c
@@ -68,7 +68,7 @@ int ima_calc_hash(struct file *file, char *digest)
 			break;
 		}
 		offset += rbuf_len;
-		sg_set_buf(sg, rbuf, rbuf_len);
+		sg_init_one(sg, rbuf, rbuf_len);
 
 		rc = crypto_hash_update(&desc, sg, rbuf_len);
 		if (rc)
@@ -95,7 +95,7 @@ int ima_calc_template_hash(int template_len, void *template, char *digest)
 	if (rc != 0)
 		return rc;
 
-	sg_set_buf(sg, template, template_len);
+	sg_init_one(sg, template, template_len);
 	rc = crypto_hash_update(&desc, sg, template_len);
 	if (!rc)
 		rc = crypto_hash_final(&desc, digest);
-- 
1.5.6.6
