From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the sound-asoc tree
Date: Tue, 31 May 2016 11:43:57 +1000
Message-ID: <20160531114357.5010daa3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37162 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161746AbcEaBn7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 May 2016 21:43:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

sound/soc/codecs/cs47l24.c: In function 'cs47l24_adsp2_irq'
:
sound/soc/codecs/cs47l24.c:1091:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
             (void *)i);
             ^
sound/soc/codecs/wm5110.c: In function 'wm5110_adsp2_irq':
sound/soc/codecs/wm5110.c:2246:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
             (void *)i);
             ^

Introduced by commit

  7baa7e2490e1 ("ASoC: arizona: Add event notification on voice trigger events")

-- 
Cheers,
Stephen Rothwell
