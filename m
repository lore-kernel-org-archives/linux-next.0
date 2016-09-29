From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xtensa tree with Linus' tree
Date: Thu, 29 Sep 2016 10:01:18 +1000
Message-ID: <20160929100118.07bac0fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753938AbcI2ABW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 20:01:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>

Hi Max,

Today's linux-next merge of the xtensa tree got a conflict in:

  arch/xtensa/kernel/setup.c

between commits:

  69d99e6c0d62 ("xtensa: Remove unnecessary of_platform_populate with default match table")
  e973f4ec130a ("xtensa: Partially Revert "xtensa: Remove unnecessary of_platform_populate with default match table"")

from Linus' tree and commit:

  205ad548a742 ("xtensa: rearrange CCOUNT calibration")

from the xtensa tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/xtensa/kernel/setup.c
index 143251ede897,d61c8468abea..000000000000
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@@ -252,14 -246,14 +245,6 @@@ void __init early_init_devtree(void *pa
  		strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
  }
  
--static int __init xtensa_device_probe(void)
--{
- 	of_clk_init(NULL);
 -	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
--	return 0;
--}
--
--device_initcall(xtensa_device_probe);
--
  #endif /* CONFIG_OF */
  
  /*
