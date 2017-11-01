From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 1 Nov 2017 15:13:07 +1100
Message-ID: <20171101151307.25e1e44c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751053AbdKAENJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 00:13:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olivier Moysan <olivier.moysan@st.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/stm/stm32_sai_sub.c: In function 'stm32_sai_hw_params':
sound/soc/stm/stm32_sai_sub.c:485:7: warning: 'cr1' may be used uninitialized in this function [-Wmaybe-uninitialized]
   cr1 |= SAI_XCR1_DS_SET(SAI_DATASIZE_8);
       ^
sound/soc/stm/stm32_sai_sub.c:469:6: note: 'cr1' was declared here
  int cr1, cr1_mask, ret;
      ^

Introduced by commit

  61fb4ff70377 ("ASoC: stm32: sai: Move static settings to DAI init")

-- 
Cheers,
Stephen Rothwell
