From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 21 Sep 2015 11:23:54 +1000
Message-ID: <20150921112354.36dd39e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bard Liao <bardliao@realtek.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/rt5645.c: In function 'rt5645_i2c_probe':
sound/soc/codecs/rt5645.c:3277:21: error: 'dmi_platform_intel_broadwel' undeclared (first use in this function)
    dmi_check_system(dmi_platform_intel_broadwel)
                     ^
sound/soc/codecs/rt5645.c:3277:21: note: each undeclared identifier is reported only once for each function it appears in
sound/soc/codecs/rt5645.c:3278:3: error: expected ')' before 'rt5645'
   rt5645->pdata = *rt5645_pdata;
   ^
sound/soc/codecs/rt5645.c:3478:1: error: expected expression before '}' token
 }
 ^
sound/soc/codecs/rt5645.c:3264:15: warning: unused variable 'val' [-Wunused-variable]
  unsigned int val;
               ^
sound/soc/codecs/rt5645.c:3263:11: warning: unused variable 'i' [-Wunused-variable]
  int ret, i;
           ^
sound/soc/codecs/rt5645.c:3263:6: warning: unused variable 'ret' [-Wunused-variable]
  int ret, i;
      ^
sound/soc/codecs/rt5645.c: At top level:
sound/soc/codecs/rt5645.c:2894:13: warning: 'rt5645_jack_detect_work' defined but not used [-Wunused-function]
 static void rt5645_jack_detect_work(struct work_struct *work)
             ^
sound/soc/codecs/rt5645.c:3090:34: warning: 'rt5645_dai' defined but not used [-Wunused-variable]
 static struct snd_soc_dai_driver rt5645_dai[] = {
                                  ^
sound/soc/codecs/rt5645.c:3131:36: warning: 'soc_codec_dev_rt5645' defined but not used [-Wunused-variable]
 static struct snd_soc_codec_driver soc_codec_dev_rt5645 = {
                                    ^
sound/soc/codecs/rt5645.c:3232:29: warning: 'dmi_platform_intel_broadwell' defined but not used [-Wunused-variable]
 static struct snd_soc_codec_driver soc_codec_dev_rt5645 = {
                                    ^
sound/soc/codecs/rt5645.c:3232:29: warning: 'dmi_platform_intel_broadwell' defined but not used [-Wunused-variable]
 static struct dmi_system_id dmi_platform_intel_broadwell[] __initdata = {
                             ^
sound/soc/codecs/rt5645.c:3244:12: warning: 'rt5645_parse_dt' defined but not used [-Wunused-function]
 static int rt5645_parse_dt(struct rt5645_priv *rt5645, struct device *dev)
            ^
sound/soc/codecs/rt5645.c: In function 'rt5645_i2c_probe':
sound/soc/codecs/rt5645.c:3478:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  3dbabe60c832 ("ASoC: rt5645: Add dmi for Broadwell")

I have used the sound-asoc tree from next-20150918 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
