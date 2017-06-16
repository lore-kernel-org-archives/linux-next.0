From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 16 Jun 2017 12:04:57 +1000
Message-ID: <20170616120457.721794b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751667AbdFPCE7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 22:04:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

sound/soc/rockchip/rockchip_i2s.c: In function 'rockchip_i2s_probe':
sound/soc/rockchip/rockchip_i2s.c:649:3: error: 'err' undeclared (first use in this function)
   err = -ENOMEM;
   ^

Caused by commit

  c3a3d3c41b74 ("ASoC: rockchip: Fix an error handling in 'rockchip_i2s_probe'")

I have used the sound-asoc tree from next-20170615 for today.

-- 
Cheers,
Stephen Rothwell
