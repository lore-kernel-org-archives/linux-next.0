From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [PATCH linux-next] Remove unused variable in mwait_play_dead()
Date: Sun, 17 Feb 2013 15:05:55 +0800
Message-ID: <1361084755.2580.21.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:59157 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753009Ab3BQHGC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Feb 2013 02:06:02 -0500
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Sun, 17 Feb 2013 17:01:28 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id CA1D73578050
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 18:05:58 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r1H75u9P38338774
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 18:05:57 +1100
Received: from d23av01.au.ibm.com (loopback [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r1H75w8T014092
	for <linux-next@vger.kernel.org>; Sun, 17 Feb 2013 18:05:58 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: len.brown@intel.com
Cc: linux-next list <linux-next@vger.kernel.org>

to avoid following compiler warning:
arch/x86/kernel/smpboot.c: In function =E2=80=98mwait_play_dead=E2=80=99=
:
arch/x86/kernel/smpboot.c:1370:22: warning: unused variable
=E2=80=98c=E2=80=99 [-Wunused-variable]

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 arch/x86/kernel/smpboot.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index a6ceaed..7bc998a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1367,7 +1367,6 @@ static inline void mwait_play_dead(void)
 	unsigned int highest_subcstate =3D 0;
 	int i;
 	void *mwait_ptr;
-	struct cpuinfo_x86 *c =3D __this_cpu_ptr(&cpu_info);
=20
 	if (!this_cpu_has(X86_FEATURE_MWAIT))
 		return;
--=20
1.8.1.2
