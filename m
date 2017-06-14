From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 14 Jun 2017 11:26:09 +1000
Message-ID: <20170614112609.205aae63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753646AbdFNB0M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 21:26:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "asoc_simple_card_clk_enable" [sound/soc/generic/snd-soc-simple-card.ko] undefined!
ERROR: "asoc_simple_card_clk_disable" [sound/soc/generic/snd-soc-simple-card.ko] undefined!

Caused by commit

  bb24a3ba3f52 ("ASoC: simple-scu-card: use asoc_simple_card_clk_xxx()")

These symbols are not exported to modules.

I have used the sound-asoc tree from next-20170613 for today.

-- 
Cheers,
Stephen Rothwell
