From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the l2-mtd tree
Date: Thu, 9 Feb 2017 12:08:39 +1100
Message-ID: <20170209120839.50a8cfdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
ERROR: "of_flash_probe_gemini" [drivers/mtd/maps/physmap_of.ko] undefined!

Probably caused by commit

  56ff337ea433 ("mtd: physmap_of: add a hook for Gemini flash probing")

The config has:

CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_OF=m
CONFIG_MTD_PHYSMAP_OF_VERSATILE=y
CONFIG_MTD_PHYSMAP_OF_GEMINI=y

I am not sure why this is a problem, but previously physmap_of_versatile.o
would have been in obj-m and it is now in obj-y.

I have used the version fo the l2-mtd tree from next-20170208 for today.

-- 
Cheers,
Stephen Rothwell
