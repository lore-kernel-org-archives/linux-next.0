From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the sunxi tree
Date: Tue, 1 Mar 2016 15:07:00 +1100
Message-ID: <20160301150700.650fbd3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/sunxi/clk-sun6i-ar100.c

between commit:

  3ca2377b6fed ("clk: sunxi: rewrite sun6i-ar100 using factors clk")

from the sunxi tree and commit:

  36bf2811416c ("clk: sunxi: Use proper type for of_clk_get_parent_count() return value")

from the clk tree.

I fixed it up (the former removed the code updated by the latter) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
