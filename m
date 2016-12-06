From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 6 Dec 2016 11:14:59 +1100
Message-ID: <20161206111459.77b05dc4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from sound/soc/codecs/cq93vc.c:32:0:
include/linux/mfd/davinci_voicecodec.h:31:27: fatal error: mach/hardware.h: No such file or directory

Probably caused by commit

  4de429888c5b ("ASoC: cq93vc: remove MFD_DAVINCI_VOICECODEC dependency for CQ0093VC")

I have used the sound-asoc tree from next-20161205 for today.

-- 
Cheers,
Stephen Rothwell
