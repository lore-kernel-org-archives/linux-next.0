From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Wed, 23 Nov 2016 09:24:17 +0100
Message-ID: <c61978cc-c38b-a9fc-a963-4d988e9dfff3@de.ibm.com>
References: <20161123144515.10cf9236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50080 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932865AbcKWIYX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Nov 2016 03:24:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAN8NeWv034537
        for <linux-next@vger.kernel.org>; Wed, 23 Nov 2016 03:24:23 -0500
Received: from e06smtp09.uk.ibm.com (e06smtp09.uk.ibm.com [195.75.94.105])
        by mx0a-001b2d01.pphosted.com with ESMTP id 26w6h3tkdr-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 23 Nov 2016 03:24:22 -0500
Received: from localhost
        by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Wed, 23 Nov 2016 08:24:20 -0000
In-Reply-To: <20161123144515.10cf9236@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Janosch Frank <frankja@linux.vnet.ibm.com>

On 11/23/2016 04:45 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvms390 tree got a conflict in:
> 
>   arch/s390/include/asm/facilities_src.h
> 
> between commit:
> 
>   d1f7e8f85b51 ("s390: squash facilities_src.h into gen_facilities.c")
> 
> from the s390 tree and commits:
> 
>   09ff894457e9 ("KVM: s390: gaccess: add ESOP2 handling")
>   88abf0b54f51 ("KVM: s390: instruction-execution-protection support")
> 
> from the kvms390 tree.
> 
> I fixed it up (I deleted the file and then added the following merge fix
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Thanks, looks fine.

Hmmm, Martin, Heiko, KVM is going to touch that file from time to time.
Can we either have 
a: a topic branch for this tool (like I did for the 4.9 merge window)
with just the patches for this tool. This topic branch can then be merged
into kvm/next and s390/features.
b: split out the kvm defines into arch/s390/tools/kvm_facilities.h


b would like something like this (cut/paste so whitespace damaged)


From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Wed, 23 Nov 2016 09:18:42 +0100
Subject: [PATCH 1/1] s390:gen_facilites: Move kvm facilities into a separate
 file

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 MAINTAINERS                      |  1 +
 arch/s390/tools/gen_facilities.c | 25 +------------------------
 arch/s390/tools/kvm_facilities.c | 26 ++++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 24 deletions(-)
 create mode 100644 arch/s390/tools/kvm_facilities.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ad9b965..941d555 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6928,6 +6928,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
 S:	Supported
 F:	Documentation/s390/kvm.txt
 F:	arch/s390/include/asm/kvm*
+F:	arch/s390/tools/kvm_facilities.c
 F:	arch/s390/kvm/
 
 KERNEL VIRTUAL MACHINE (KVM) FOR ARM
diff --git a/arch/s390/tools/gen_facilities.c b/arch/s390/tools/gen_facilities.c
index 8cc53b1..af91c69 100644
--- a/arch/s390/tools/gen_facilities.c
+++ b/arch/s390/tools/gen_facilities.c
@@ -59,30 +59,7 @@ static struct facility_def facility_defs[] = {
 			-1 /* END */
 		}
 	},
-	{
-		.name = "FACILITIES_KVM",
-		.bits = (int[]){
-			0,  /* N3 instructions */
-			1,  /* z/Arch mode installed */
-			2,  /* z/Arch mode active */
-			3,  /* DAT-enhancement */
-			4,  /* idte segment table */
-			5,  /* idte region table */
-			6,  /* ASN-and-LX reuse */
-			7,  /* stfle */
-			8,  /* enhanced-DAT 1 */
-			9,  /* sense-running-status */
-			10, /* conditional sske */
-			13, /* ipte-range */
-			14, /* nonquiescing key-setting */
-			73, /* transactional execution */
-			75, /* access-exception-fetch/store indication */
-			76, /* msa extension 3 */
-			77, /* msa extension 4 */
-			78, /* enhanced-DAT 2 */
-			-1  /* END */
-		}
-	},
+	#include "kvm_facilities.c"
 };
 
 static void print_facility_list(struct facility_def *def)
diff --git a/arch/s390/tools/kvm_facilities.c b/arch/s390/tools/kvm_facilities.c
new file mode 100644
index 0000000..f6bb1ae
--- /dev/null
+++ b/arch/s390/tools/kvm_facilities.c
@@ -0,0 +1,26 @@
+/* To be included by arch/s390/tools/gen_facilities.c */
+	{
+		.name = "FACILITIES_KVM",
+		.bits = (int[]){
+			0,  /* N3 instructions */
+			1,  /* z/Arch mode installed */
+			2,  /* z/Arch mode active */
+			3,  /* DAT-enhancement */
+			4,  /* idte segment table */
+			5,  /* idte region table */
+			6,  /* ASN-and-LX reuse */
+			7,  /* stfle */
+			8,  /* enhanced-DAT 1 */
+			9,  /* sense-running-status */
+			10, /* conditional sske */
+			13, /* ipte-range */
+			14, /* nonquiescing key-setting */
+			73, /* transactional execution */
+			75, /* access-exception-fetch/store indication */
+			76, /* msa extension 3 */
+			77, /* msa extension 4 */
+			78, /* enhanced-DAT 2 */
+			-1  /* END */
+		}
+	},
+
-- 
2.5.5
