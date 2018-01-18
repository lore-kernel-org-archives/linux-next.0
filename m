From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the libata tree
Date: Thu, 18 Jan 2018 15:26:01 +1100
Message-ID: <20180118152601.31761830@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33391 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752184AbeARE0D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Jan 2018 23:26:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/phy/broadcom/phy-brcm-sata.c: In function 'brcm_stb_sata_calibrate':
drivers/phy/broadcom/phy-brcm-sata.c:514:24: warning: unused variable 'priv' [-Wunused-variable]
  struct brcm_sata_phy *priv = port->phy_priv;
                        ^~~~

Introduced by commit

  3e507769d15e ("phy: brcm-sata: Implement calibrate callback")

-- 
Cheers,
Stephen Rothwell
