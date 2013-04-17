From: David Rientjes <rientjes@google.com>
Subject: [patch] x86, kvm: fix build failure with CONFIG_SMP disabled
Date: Wed, 17 Apr 2013 16:12:05 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304171609580.5541@chino.kir.corp.google.com>
References: <20130417170450.5dd6e5f450de4d5bf197d997@canb.auug.org.au> <516EE5AB.4080201@infradead.org> <alpine.DEB.2.02.1304171555030.10112@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:61899 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752459Ab3DQXMI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 19:12:08 -0400
Received: by mail-pa0-f47.google.com with SMTP id bj3so1152174pad.20
        for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 16:12:07 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1304171555030.10112@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>

The build fails when CONFIG_SMP is disabled:

	arch/x86/kvm/vmx.c: In function 'vmx_deliver_posted_interrupt':
	arch/x86/kvm/vmx.c:3950:3: error: 'apic' undeclared (first use in this function)

Fix it by including the necessary header.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: David Rientjes <rientjes@google.com>
---
 arch/x86/kvm/vmx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -34,6 +34,7 @@
 #include "kvm_cache_regs.h"
 #include "x86.h"
 
+#include <asm/apic.h>
 #include <asm/io.h>
 #include <asm/desc.h>
 #include <asm/vmx.h>
