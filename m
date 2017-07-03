From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 3 Jul 2017 12:26:25 +1000
Message-ID: <20170703122625.11647da4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vunny Sodhi <vunnyx.sodhi@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from sound/soc/intel/skylake/skl-debug.c:23:0:
sound/soc/intel/skylake/../common/sst-dsp-priv.h:63:42: warning: 'struct sst_pdata' declared inside parameter list
  int (*init)(struct sst_dsp *sst, struct sst_pdata *pdata);
                                          ^
sound/soc/intel/skylake/../common/sst-dsp-priv.h:63:42: warning: its scope is only this definition or declaration, which is probably not what you want

Exposed by commit

  bdd0384a5ada ("ASoC: Intel: Skylake: Add support to read firmware registers")

-- 
Cheers,
Stephen Rothwell
