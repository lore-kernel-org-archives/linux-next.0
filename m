From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the rpmsg tree
Date: Wed, 16 Nov 2016 14:20:08 +1100
Message-ID: <20161116142008.19d4aba9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45157 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752803AbcKPDUK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Nov 2016 22:20:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>

Hi Bjorn,

After merging the rpmsg tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:3:	symbol REMOTEPROC is selected by QCOM_ADSP_PIL
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:81:	symbol QCOM_ADSP_PIL depends on REMOTEPROC

Introduced by commit

  b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")

-- 
Cheers,
Stephen Rothwell
