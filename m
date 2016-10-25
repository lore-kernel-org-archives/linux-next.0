From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sunxi tree
Date: Tue, 25 Oct 2016 11:26:28 +1100
Message-ID: <20161025112628.44493fd6@canb.auug.org.au>
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
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "pwm1_pins_a"
ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:313: recipe for target 'arch/arm/boot/dts/ntc-gr8-chip-pro.dtb' failed

Caused by commit

  f49f86fa3b49 ("ARM: gr8: Add CHIP Pro support")

I have used the sunxi tree from next-20161024 for today.

-- 
Cheers,
Stephen Rothwell
