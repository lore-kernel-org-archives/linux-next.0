From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with the qcom tree
Date: Mon, 6 Feb 2017 10:23:29 +1100
Message-ID: <20170206102329.04879df9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34157 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751165AbdBEXXg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 18:23:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Andy Gross <andy.gross@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>

Hi all,

Today's linux-next merge of the arm64 tree got conflicts in:

  arch/arm/kernel/armksyms.c
  arch/arm64/kernel/arm64ksyms.c
  arch/arm64/kernel/smccc-call.S
  include/linux/arm-smccc.h

between commits:

  0a0c5b832751 ("arm: kernel: Add SMC structure parameter")
  9c96e7f72029 ("firmware: qcom: scm: Fix interrupted SCM calls")

from the qcom tree and commits:

  680a0873e193 ("arm: kernel: Add SMC structure parameter")
  82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")

from the arm64 tree.

I fixed it up (please check the final resolution when it is released,
or fix these up) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
