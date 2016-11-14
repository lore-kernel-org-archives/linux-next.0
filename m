From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 14 Nov 2016 11:28:01 +1100
Message-ID: <20161114112801.46392f36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48841 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751599AbcKNA2E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Nov 2016 19:28:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/wm_adsp.c: In function 'wm_coeff_write_acked_control':
sound/soc/codecs/wm_adsp.c:791:8: error: implicit declaration of function 'wm_coeff_base_reg' [-Werror=implicit-function-declaration]
  ret = wm_coeff_base_reg(ctl, &reg);
        ^

Caused by commit

  f4f0c4c60c39 ("ASoC: wm_adsp: Signal firmware shutdown through event control")

I have used the sound-asoc tree from next-20161111 for today.

-- 
Cheers,
Stephen Rothwell
