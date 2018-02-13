From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the libata tree
Date: Tue, 13 Feb 2018 14:04:49 +1100
Message-ID: <20180213140449.35e337cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>, Hien Dang <hien.dang.eb@rvc.renesas.com>, Yoshihiro Kaneko <ykaneko0929@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/ata/sata_rcar.c: In function 'sata_rcar_init_controller':
drivers/ata/sata_rcar.c:821:16: warning: unused variable 'base' [-Wunused-variable]
  void __iomem *base = priv->base;
                ^~~~

Introduced by commit

  da77d76b95a0 ("sata_rcar: Reset SATA PHY when Salvator-X board resumes")

-- 
Cheers,
Stephen Rothwell
