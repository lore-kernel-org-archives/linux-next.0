From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] x86, intel_mid: Kconfig select fix
Date: Tue, 06 Dec 2011 13:28:22 +0000
Message-ID: <20111206132811.4041.32549.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:55849 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386Ab1LFNQf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2011 08:16:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu, linux-next@vger.kernel.org

From: Alan Cox <alan@linux.intel.com>

If we select a symbol it should have a type declared first otherwise in
some situations the config tools get upset. They are currently perhaps a
bit too resilient which is why this wasn't noticed initially.

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)


diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index b884f4c..d48585b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -406,6 +406,9 @@ config X86_WANT_INTEL_MID
 
 if X86_WANT_INTEL_MID
 
+config X86_INTEL_MID
+	bool
+
 config X86_MRST
        bool "Moorestown MID platform"
 	depends on PCI
