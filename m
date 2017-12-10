From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Mon, 11 Dec 2017 10:16:32 +1100
Message-ID: <20171211101632.6ebe90eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751379AbdLJXQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Dec 2017 18:16:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Taniya Das <tdas@codeaurora.org>

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/mmcc-msm8996.ko] undefined!
ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-msm8996.ko] undefined!
ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-msm8994.ko] undefined!
ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-ipq8074.ko] undefined!
ERROR: "clk_hw_is_enabled" [drivers/clk/qcom/clk-qcom.ko] undefined!

Caused by commits

  d1506b749e92 ("clk: qcom: support for alpha pll properties")
  e66a4d6d0081 ("clk: qcom: support for dynamic updating the PLL")
  301803e6013b ("clk: qcom: support Huayra type Alpha PLL")

I have used the clk tree from next-20171208 for today.

-- 
Cheers,
Stephen Rothwell
