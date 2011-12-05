From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] x86/intel_mid: Fix the Kconfig for MID selection
Date: Mon, 05 Dec 2011 23:14:39 +0000
Message-ID: <20111205231433.28811.51297.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:53492 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508Ab1LEXU3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 18:20:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu, linux-next@vger.kernel.org

From: Alan Cox <alan@linux.intel.com>

We could build all the bits to make generic MID work if you picked
MID platform alone but that's really silly. Instead use select and
two variables.

This looks a bit daft right now but once we add a Medfield selection
it'll start to look a good deal more sensible.

Reported-by: Ingo Molnar <mingo@elte.hu>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/Kconfig |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)


diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4ee940c..b884f4c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -395,7 +395,7 @@ config X86_INTEL_CE
 	  This option compiles in support for the CE4100 SOC for settop
 	  boxes and media devices.
 
-config X86_INTEL_MID
+config X86_WANT_INTEL_MID
 	bool "Intel MID platform support"
 	depends on X86_32
 	depends on X86_EXTENDED_PLATFORM
@@ -404,7 +404,7 @@ config X86_INTEL_MID
 	  systems which do not have the PCI legacy interfaces (Moorestown,
 	  Medfield). If you are building for a PC class system say N here.
 
-if X86_INTEL_MID
+if X86_WANT_INTEL_MID
 
 config X86_MRST
        bool "Moorestown MID platform"
@@ -416,6 +416,7 @@ config X86_MRST
 	select SPI
 	select INTEL_SCU_IPC
 	select X86_PLATFORM_DEVICES
+	select X86_INTEL_MID
 	---help---
 	  Moorestown is Intel's Low Power Intel Architecture (LPIA) based Moblin
 	  Internet Device(MID) platform. Moorestown consists of two chips:
