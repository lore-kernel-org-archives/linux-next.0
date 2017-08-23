From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 23 Aug 2017 12:20:07 +1000
Message-ID: <20170823122007.6dbcd592@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/tegra/tegra_wm8903.c: In function 'tegra_wm8903_remove':
sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable 'machine' [-Wunused-variable]
  struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
                       ^

Introduced by commit

  2a8bd83af30e ("ASoC: tegra: Remove superfluous snd_soc_jack_free_gpios() call")

-- 
Cheers,
Stephen Rothwell
