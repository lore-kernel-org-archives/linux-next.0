From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the battery tree
Date: Tue, 29 Sep 2015 11:45:31 +1000
Message-ID: <20150929114531.2d611a2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>
List-Id: linux-next.vger.kernel.org

Hi Sebastian,

After merging the battery tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "twl4030_madc"
ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap3-beagle-xm-ab.dtb' failed

and many more ...

Caused by commit

  af19161aaed7 ("ARM: dts: twl4030: Add iio properties for bci subnode")

Presumably some updates to other files were missed.

I have used the battery tree from next-20150925 fot today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
