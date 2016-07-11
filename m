From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-msm tree
Date: Mon, 11 Jul 2016 13:20:58 +1000
Message-ID: <20160711132058.6339062f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57628 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757580AbcGKDVA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jul 2016 23:21:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dave Airlie <airlied@linux.ie>

Hi Rob,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/hdmi/hdmi.c:523:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .hw_params = msm_hdmi_audio_hw_params,
               ^
drivers/gpu/drm/msm/hdmi/hdmi.c:523:15: note: (near initialization for 'msm_hdmi_audio_codec_ops.hw_params')
drivers/gpu/drm/msm/hdmi/hdmi.c:524:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .audio_shutdown = msm_hdmi_audio_shutdown,
                    ^
drivers/gpu/drm/msm/hdmi/hdmi.c:524:20: note: (near initialization for 'msm_hdmi_audio_codec_ops.audio_shutdown')

Caused by commit

  bf714255fed7 ("drm: msm: Add ASoC generic hdmi audio codec support.")

interacting with commit

  efc9194bcff8 ("ASoC: hdmi-codec: callback function will be called with private data")

from the sound-asoc (and drm) trees.

I have added this merge fix patch for today (dave will need something
like this when he merges your tree):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Jul 2016 13:16:23 +1000
Subject: [PATCH] drm: msm: fix up for "ASoC: hdmi-codec: callback function
 will be called with private data"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index aada35547eca..33bf52c6b312 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -438,7 +438,7 @@ static int msm_hdmi_get_gpio(struct device_node *of_node, const char *name)
 /*
  * HDMI audio codec callbacks
  */
-static int msm_hdmi_audio_hw_params(struct device *dev,
+static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
 				    struct hdmi_codec_daifmt *daifmt,
 				    struct hdmi_codec_params *params)
 {
@@ -512,7 +512,7 @@ static int msm_hdmi_audio_hw_params(struct device *dev,
 	return 0;
 }
 
-static void msm_hdmi_audio_shutdown(struct device *dev)
+static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
