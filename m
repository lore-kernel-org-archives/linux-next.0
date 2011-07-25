From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] kvm: fix TASK_DELAY_ACCT kconfig warning
Date: Mon, 25 Jul 2011 11:01:09 -0700
Message-ID: <20110725110109.b06fe691.rdunlap@xenotime.net>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:53256 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751214Ab1GYSBM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2011 14:01:12 -0400
In-Reply-To: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, x86@kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix kconfig dependency warning:

warning: (KVM) selects TASK_DELAY_ACCT which has unmet direct dependencies (TASKSTATS)

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/kvm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110725.orig/arch/x86/kvm/Kconfig
+++ linux-next-20110725/arch/x86/kvm/Kconfig
@@ -31,6 +31,7 @@ config KVM
 	select KVM_ASYNC_PF
 	select USER_RETURN_NOTIFIER
 	select KVM_MMIO
+	select TASKSTATS
 	select TASK_DELAY_ACCT
 	---help---
 	  Support hosting fully virtualized guest machines using hardware
