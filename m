From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the phy-next tree
Date: Thu, 30 Mar 2017 14:47:35 +1100
Message-ID: <20170330144735.534101e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Meng Dongyang <daniel.meng@rock-chips.com>
List-Id: linux-next.vger.kernel.org

Hi Kishon,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/phy/phy-rockchip-inno-usb2.c:1148:3: error: unknown field 'phy_tuning' specified in initializer
   .phy_tuning = rk3328_usb2phy_tuning,
   ^
drivers/phy/phy-rockchip-inno-usb2.c:1148:17: error: 'rk3328_usb2phy_tuning' undeclared here (not in a function)
   .phy_tuning = rk3328_usb2phy_tuning,
                 ^

Caused by commit

  ffa0c278e89c ("phy: rockchip-inno-usb2: add support of u2phy for rk3328")

I have used the phy-next tree from next-20170329 for today.

-- 
Cheers,
Stephen Rothwell
