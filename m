From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Wed, 12 Aug 2015 17:19:12 +1000
Message-ID: <20150812171912.03110efc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "pm_genpd_init" [drivers/clk/qcom/clk-qcom.ko] undefined!

Caused by commit

  0c4172846b0b ("clk: qcom: Add support for GDSCs")

I have used the clk tree from next-20150810 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
