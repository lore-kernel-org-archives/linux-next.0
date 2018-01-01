From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Tue, 2 Jan 2018 08:51:34 +1100
Message-ID: <20180102085134.198ea1f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53299 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751927AbeAAVvh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jan 2018 16:51:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "clk_regmap_mux_div_ops" [drivers/clk/qcom/apcs-msm8916.ko] undefined!
ERROR: "__mux_div_set_src_div" [drivers/clk/qcom/apcs-msm8916.ko] undefined!

Caused by commit

  8a77f61118a2 ("clk: qcom: Add APCS clock controller support")

I have used the clk tree from next-20171222 for today.

-- 
Cheers,
Stephen Rothwell
