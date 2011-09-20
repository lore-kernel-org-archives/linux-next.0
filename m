From: Stephen Rothwell <sfr@au1.ibm.com>
Subject: linux-next: manual merge of the regmap tree with the mfd tree
Date: Tue, 20 Sep 2011 15:42:18 +1000
Message-ID: <20110920154218.27c270321f7b24d6b2a8d862@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Mark,

Today's linux-next merge of the regmap tree got a conflict in
drivers/mfd/wm831x-spi.c between commit 7ba771ee9c6f ("mfd: Support
software initiated shutdown of WM831x PMICs") from the mfd tree and
commit 5570c2f709bd ("mfd: Use device ID matching for WM831x SPI driver")
from the regmap tree.

I am not sure of the resolution here, so I just used the regmap tree
version (which drops the shutdown member of wm8311_spi_driver added in
the mfd version).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
