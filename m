From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sunxi tree
Date: Tue, 14 Jun 2016 12:18:55 +1000
Message-ID: <20160614121855.51b7da7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Maxime,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: warning: unused variable 'num_parents' [-Wunused-variable]
  int num_parents = clk_hw_get_num_parents(hw);
      ^

Introduced by commit

  4de2d58bc973 ("clk: sunxi: tcon-ch1: Do not return a negative error in get_parent")

-- 
Cheers,
Stephen Rothwell
