From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-msm tree
Date: Tue, 15 Dec 2015 12:27:21 +1100
Message-ID: <20151215122721.08ff1448@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Vinay Simha BN <vinaysimha@inforcecomputing.com>
List-Id: linux-next.vger.kernel.org

Hi Rob,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c: In function 'mdp4_dsi_encoder_init':
drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c:187:2: error: too few arguments to function 'drm_encoder_init'
  drm_encoder_init(dev, encoder, &mdp4_dsi_encoder_funcs,
  ^
In file included from include/drm/drmP.h:68:0,
                 from drivers/gpu/drm/msm/msm_drv.h:37,
                 from drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.h:21,
                 from drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c:20:
include/drm/drm_crtc.h:2220:5: note: declared here
 int drm_encoder_init(struct drm_device *dev,
     ^

Caused by commit

  776638e73a19 ("drm/msm/dsi: Add a mdp4 encoder for DSI")

interacting withe commit

  13a3d91f17a5 ("drm: Pass 'name' to drm_encoder_init()")

from the drm-misc tree.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 15 Dec 2015 12:23:41 +1100
Subject: [PATCH] drm/msm/dsi: update for drm_encoder_init() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c
index 49052bb5d2e4..2f57e9453b67 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c
@@ -185,7 +185,7 @@ struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 	encoder = &mdp4_dsi_encoder->base;
 
 	drm_encoder_init(dev, encoder, &mdp4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI);
+			 DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dsi_encoder_helper_funcs);
 
 	return encoder;
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
