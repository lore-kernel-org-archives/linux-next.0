From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 4 Sep 2017 12:27:00 +1000
Message-ID: <20170904122700.03164a47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33881 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753180AbdIDC1C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Sep 2017 22:27:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li Xu <li.xu@cirrus.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/cs43130.c: In function 'cs43130_imp_meas':
sound/soc/codecs/cs43130.c:2089:18: warning: 'hpload_seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
        hpload_seq[i].msk, ac_idx);
                  ^

Introduced by commit

  8f1e5bf9b440 ("ASoC: cs43130: Add support for CS43130 codec")

This is probably a false positive.

-- 
Cheers,
Stephen Rothwell
