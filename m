From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 13 Feb 2018 12:51:23 +1100
Message-ID: <20180213125123.003f92f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/wm9081.c: In function 'wm9081_digital_mute':
sound/soc/codecs/wm9081.c:1161:7: warning: 'reg' may be used uninitialized in this function [-Wmaybe-uninitialized]
   reg |= WM9081_DAC_MUTE;

Introduced by commit

  48c338764296 ("ASoC: wm9081: replace codec to component")

-- 
Cheers,
Stephen Rothwell
