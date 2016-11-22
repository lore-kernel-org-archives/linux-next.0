From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 22 Nov 2016 19:41:30 +1100
Message-ID: <20161122194130.4efdd019@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the clk tree got conflicts in:

  arch/arm/boot/dts/r8a7779.dtsi
  arch/arm/boot/dts/r8a7790.dtsi
  arch/arm/boot/dts/r8a7791.dtsi
  arch/arm/boot/dts/r8a7792.dtsi
  arch/arm/boot/dts/r8a7793.dtsi
  arch/arm/boot/dts/r8a7794.dtsi
  arch/arm/mach-shmobile/setup-rcar-gen2.c
  arch/arm64/boot/dts/renesas/r8a7795.dtsi
  arch/arm64/boot/dts/renesas/r8a7796.dtsi
  drivers/soc/renesas/Makefile

between various commits from the arm-soc tree and commits from the
clk tree.

It was just too much at this time of day, so please talk to each other
and figure out how to fix these up.  I have used the clk tree from
next-20161117 for today.

-- 
Cheers,
Stephen Rothwell
