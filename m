From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the qcom tree
Date: Fri, 1 Apr 2016 10:28:14 +1100
Message-ID: <20160401102814.1cf1b302@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56465 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753371AbcCaX2Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Mar 2016 19:28:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Gross <agross@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "blsp2_dma"

ERROR (phandle_references): Reference to non-existent node or label "blsp2_dma"

ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:307: recipe for target 'arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dtb' failed

Maybe caused by commit

  423f5fed42fa ("Revert "dts: msm8974: Add blsp2_bam dma node"")

I have used the qcom tree from next-20160331 for today.

-- 
Cheers,
Stephen Rothwell
