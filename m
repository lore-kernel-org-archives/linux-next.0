From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: linux-next: merge conflict between kvms390/next and s390/features
Date: Tue, 7 Jun 2016 15:07:55 +0200
Message-ID: <201606071308.u57D4Td9035536@mx0a-001b2d01.pphosted.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60308 "EHLO
	mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932114AbcFGNIT convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2016 09:08:19 -0400
Received: from pps.filterd (m0075420.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u57D4Td9035536
	for <linux-next@vger.kernel.org>; Tue, 7 Jun 2016 09:08:18 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 23duqsb1a2-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 07 Jun 2016 09:08:16 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Tue, 7 Jun 2016 14:08:03 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 289E217D805D
	for <linux-next@vger.kernel.org>; Tue,  7 Jun 2016 14:09:09 +0100 (BST)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id u57D7xR957671844
	for <linux-next@vger.kernel.org>; Tue, 7 Jun 2016 13:07:59 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id u57D7wvk005585
	for <linux-next@vger.kernel.org>; Tue, 7 Jun 2016 07:07:58 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hi Stephen,

we got a report of a compile error due to a clash between the features branch
and the kvm branch for s390. Fixed with the following patch:
--
>From 39e60f02654946c40a3d2b78239316c431588145 Mon Sep 17 00:00:00 2001
From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Tue, 7 Jun 2016 14:49:43 +0200
Subject: [PATCH] s390: fix merge conflict in arch/s390/kvm/kvm-s390.c

git commit 6bc43e18f530bee307135f9dc8636df3b5fc4d42
"KVM: s390: interface to query and configure cpu subfunctions"

and git commit cc8f9465648745ef32e86fee0f182109b6fd67b3
"s390/time: move PTFF definitions"

cause a compile error in arch/s390/kvm/kvm-s390.c. Use the new
ptff defines from arch/s390/include/asm/timex.h.

Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
---
 arch/s390/kvm/kvm-s390.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index fa51aef..14d14b9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -37,7 +37,7 @@
 #include <asm/isc.h>
 #include <asm/sclp.h>
 #include <asm/cpacf.h>
-#include <asm/etr.h>
+#include <asm/timex.h>
 #include "kvm-s390.h"
 #include "gaccess.h"
 
@@ -227,7 +227,8 @@ static void kvm_s390_cpu_feat_init(void)
 	}
 
 	if (test_facility(28)) /* TOD-clock steering */
-		etr_ptff(kvm_s390_available_subfunc.ptff, ETR_PTFF_QAF);
+		ptff(kvm_s390_available_subfunc.ptff,
+		     sizeof(kvm_s390_available_subfunc.ptff), PTFF_QAF);
 
 	if (test_facility(17)) { /* MSA */
 		__cpacf_query(CPACF_KMAC, kvm_s390_available_subfunc.kmac);
-- 
2.6.6
-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
