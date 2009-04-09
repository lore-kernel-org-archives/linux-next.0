From: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Subject: RE: next-0409: kvm-ia64 build failure when !MODULES
Date: Thu, 9 Apr 2009 21:37:28 +0800
Message-ID: <706158FABBBA044BAD4FE898A02E4BC2327A201E@pdsmsx503.ccr.corp.intel.com>
References: <a4423d670904090605w2f26970o37b2493e9bbf2630@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:32645 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750912AbZDINhe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 09:37:34 -0400
In-Reply-To: <a4423d670904090605w2f26970o37b2493e9bbf2630@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "kvm-ia64@vger.kernel.org" <kvm-ia64@vger.kernel.org>, Avi Kivity <avi@redhat.com>

Hi, Avi 
    Please apply this patch to fix the issue. 
Xiantao


>From 053f7d5480916b693ffc89f7d4c57883467dbeff Mon Sep 17 00:00:00 2001
From: Xiantao Zhang <xiantao.zhang@intel.com>
Date: Thu, 9 Apr 2009 21:27:44 +0800
Subject: [PATCH] KVM: ia64: make kvm depend on CONFIG_MODULES.

Since kvm-intel modue can't be built-in, so make kvm depend on
CONFIG_MODULES.
Signed-off-by: Xiantao Zhang <xiantao.zhang@intel.com>
---
 arch/ia64/kvm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/kvm/Kconfig b/arch/ia64/kvm/Kconfig
index 0a2d6b8..64d5209 100644
--- a/arch/ia64/kvm/Kconfig
+++ b/arch/ia64/kvm/Kconfig
@@ -23,7 +23,7 @@ if VIRTUALIZATION

 config KVM
        tristate "Kernel-based Virtual Machine (KVM) support"
-       depends on HAVE_KVM && EXPERIMENTAL
+       depends on HAVE_KVM && MODULES && EXPERIMENTAL
        # for device assignment:
        depends on PCI
        select PREEMPT_NOTIFIERS
--
1.6.0


Alexander Beregalov wrote:
> Hi
> 
> arch/ia64/kvm/kvm-ia64.c: In function 'kvm_patch_vmm':
> arch/ia64/kvm/kvm-ia64.c:1686: error: dereferencing pointer to
> incomplete type arch/ia64/kvm/kvm-ia64.c: In function
> 'kvm_relocate_vmm': arch/ia64/kvm/kvm-ia64.c:1718: error:
> dereferencing pointer to incomplete type
> arch/ia64/kvm/kvm-ia64.c:1719: error: dereferencing pointer to
> incomplete type  
> 
> # CONFIG_MODULES is not set
