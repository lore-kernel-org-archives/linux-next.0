From: Seth Jennings <sjenning@linux.vnet.ibm.com>
Subject: [PATCH v2] powerpc/crypto: fix defconfig break
Date: Tue, 31 Jul 2012 23:15:29 -0500
Message-ID: <1343794529-28329-1-git-send-email-sjenning@linux.vnet.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:35269 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab2HAEPk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Aug 2012 00:15:40 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <sjenning@linux.vnet.ibm.com>;
	Tue, 31 Jul 2012 22:15:39 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Seth Jennings <sjenning@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kent Yoder <key@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, anton@samba.org

As part of the Kconfig rework for drivers/crypto/nx, the meaning of
CONFIG_CRYPTO_DEV_NX was changed.  At the same time this commit was
heading upstream

fd297b3a7302ab866306f53c1fd1e97b083fe83e
powerpc: Enable pseries hardware RNG and crypto module

still used the old meaning, set CONFIG_CRYPTO_DEV_NX=m when it
is now a bool in the Kconfig.  This patch repairs the break.

Reported-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Seth Jennings <sjenning@linux.vnet.ibm.com>
---
This patch is based on Linus master which already contains
the commit above.  Please apply this patch before my patchset
(powerpc/crypto: IBM Power7+ in-Nest compression support) to
avoid the defconfig break.

 arch/powerpc/configs/ppc64_defconfig   |    3 ++-
 arch/powerpc/configs/pseries_defconfig |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index db27c82..2d9150a1 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -487,7 +487,8 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_HW=y
-CONFIG_CRYPTO_DEV_NX=m
+CONFIG_CRYPTO_DEV_NX=y
+CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 1f65b3c..9f4a936 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -369,7 +369,8 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_HW=y
-CONFIG_CRYPTO_DEV_NX=m
+CONFIG_CRYPTO_DEV_NX=y
+CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=y
-- 
1.7.9.5
