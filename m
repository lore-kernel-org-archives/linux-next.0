From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 29 Nov 2017 11:50:14 +1100
Message-ID: <20171129115014.0624d213@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "snd_soc_disconnect_sync" [sound/soc/sh/rcar/snd-soc-rcar.ko] undefined!

Caused by commit

  180d9ef58104 ("ASoC: rsnd: call snd_soc_disconnect_sync() when remove")

I have used the sound-asco tree from next-20171128 for today.

-- 
Cheers,
Stephen Rothwell
