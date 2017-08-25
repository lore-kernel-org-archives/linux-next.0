From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 25 Aug 2017 17:41:11 +1000
Message-ID: <20170825174111.0ba91a9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44387 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754584AbdHYHlO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Aug 2017 03:41:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hsin-Yu Chao <hychao@chromium.org>

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/soc/codecs/rt5514.c: In function 'rt5514_dsp_voice_wake_up_put':
sound/soc/codecs/rt5514.c:343:11: error: implicit declaration of function 'rt5514_spi_burst_write' [-Werror=implicit-function-declaration]
     ret = rt5514_spi_burst_write(0x4ff80000,
           ^

Caused by commit

  d18420b0a0b8 ("ASoC: rt5514: expose Hotword Model control")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
