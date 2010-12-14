From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Wed, 15 Dec 2010 10:54:35 +1100
Message-ID: <20101215105435.3ce83f21.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49646 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755410Ab0LNXym (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Dec 2010 18:54:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Martin <dave.martin@linaro.org>

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/Kconfig between commit 6e6fc998b8c127fe06b9350a1f16e41bfe4f109d
("ARM: 6533/1: Thumb-2: Make CONFIG_THUMB2_KERNEL depend on !CPU_V6")
from the arm-current tree and commit
4a50bfe365a977f634311504484342fbfffe855c ("ARM: Ensure experimental
options are so marked") from the arm tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig
index d56d21c0,e77fe0f..0000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -1310,8 -1319,8 +1319,8 @@@ config H
  	default 100
  
  config THUMB2_KERNEL
- 	bool "Compile the kernel in Thumb-2 mode"
+ 	bool "Compile the kernel in Thumb-2 mode (EXPERIMENTAL)"
 -	depends on CPU_V7 && EXPERIMENTAL
 +	depends on CPU_V7 && !CPU_V6 && EXPERIMENTAL
  	select AEABI
  	select ARM_ASM_UNIFIED
  	help
