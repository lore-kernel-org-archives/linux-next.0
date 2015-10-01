From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Thu, 1 Oct 2015 11:13:19 +1000
Message-ID: <20151001111319.52dd5f94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57276 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750902AbbJABNW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Sep 2015 21:13:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/include/asm/mips-cm.h

between commit:

  7573b94e08ae ("MIPS: CM: Provide a function to map from CPU to VP ID.")

from Linus' tree and commit:

  3d04e4b34962 ("MIPS: Enable L2 prefetching for CM >= 2.5")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/include/asm/mips-cm.h
index 1f1927ab4269,36530fd8a9bf..000000000000
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@@ -194,7 -194,8 +194,9 @@@ BUILD_CM_RW(reg3_mask,		MIPS_CM_GCB_OF
  BUILD_CM_R_(gic_status,		MIPS_CM_GCB_OFS + 0xd0)
  BUILD_CM_R_(cpc_status,		MIPS_CM_GCB_OFS + 0xf0)
  BUILD_CM_RW(l2_config,		MIPS_CM_GCB_OFS + 0x130)
 +BUILD_CM_RW(sys_config2,	MIPS_CM_GCB_OFS + 0x150)
+ BUILD_CM_RW(l2_pft_control,	MIPS_CM_GCB_OFS + 0x300)
+ BUILD_CM_RW(l2_pft_control_b,	MIPS_CM_GCB_OFS + 0x308)
  
  /* Core Local & Core Other register accessor functions */
  BUILD_CM_Cx_RW(reset_release,	0x00)
@@@ -317,10 -319,20 +320,24 @@@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80
  #define CM_GCR_L2_CONFIG_ASSOC_SHF		0
  #define CM_GCR_L2_CONFIG_ASSOC_MSK		(_ULCAST_(0xff) << 0)
  
 +/* GCR_SYS_CONFIG2 register fields */
 +#define CM_GCR_SYS_CONFIG2_MAXVPW_SHF		0
 +#define CM_GCR_SYS_CONFIG2_MAXVPW_MSK		(_ULCAST_(0xf) << 0)
 +
+ /* GCR_L2_PFT_CONTROL register fields */
+ #define CM_GCR_L2_PFT_CONTROL_PAGEMASK_SHF	12
+ #define CM_GCR_L2_PFT_CONTROL_PAGEMASK_MSK	(_ULCAST_(0xfffff) << 12)
+ #define CM_GCR_L2_PFT_CONTROL_PFTEN_SHF		8
+ #define CM_GCR_L2_PFT_CONTROL_PFTEN_MSK		(_ULCAST_(0x1) << 8)
+ #define CM_GCR_L2_PFT_CONTROL_NPFT_SHF		0
+ #define CM_GCR_L2_PFT_CONTROL_NPFT_MSK		(_ULCAST_(0xff) << 0)
+ 
+ /* GCR_L2_PFT_CONTROL_B register fields */
+ #define CM_GCR_L2_PFT_CONTROL_B_CEN_SHF		8
+ #define CM_GCR_L2_PFT_CONTROL_B_CEN_MSK		(_ULCAST_(0x1) << 8)
+ #define CM_GCR_L2_PFT_CONTROL_B_PORTID_SHF	0
+ #define CM_GCR_L2_PFT_CONTROL_B_PORTID_MSK	(_ULCAST_(0xff) << 0)
+ 
  /* GCR_Cx_COHERENCE register fields */
  #define CM_GCR_Cx_COHERENCE_COHDOMAINEN_SHF	0
  #define CM_GCR_Cx_COHERENCE_COHDOMAINEN_MSK	(_ULCAST_(0xff) << 0)
