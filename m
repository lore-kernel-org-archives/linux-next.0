From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Tue, 2 Jan 2018 12:48:59 +1100
Message-ID: <20180102124859.27c2e1fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751130AbeABBtB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jan 2018 20:49:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:219:6: error: redefinition of 'dm_dp_mst_dc_sink_create'
 void dm_dp_mst_dc_sink_create(struct drm_connector *connector)
      ^
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:183:6: note: previous definition of 'dm_dp_mst_dc_sink_create' was here
 void dm_dp_mst_dc_sink_create(struct drm_connector *connector)
      ^

Caused by commit

  391ef035200f ("drm/amd/display: Fix rehook MST display not light back on")

automatically mergeing badly with commit

  becd0875f439 ("drm/amd/display: Fix rehook MST display not light back on")

from Linus' tree.

I applied this merge fix patch (to remove the second copy of
dm_dp_mst_dc_sink_create):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Jan 2018 12:43:32 +1100
Subject: [PATCH] drm/amd/display: fix mismerge of identical patches

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 36 ----------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7ace4dd302c1..f3d87f418d2e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -216,42 +216,6 @@ void dm_dp_mst_dc_sink_create(struct drm_connector *connector)
 					&aconnector->base, aconnector->edid);
 }
 
-void dm_dp_mst_dc_sink_create(struct drm_connector *connector)
-{
-	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct edid *edid;
-	struct dc_sink *dc_sink;
-	struct dc_sink_init_data init_params = {
-			.link = aconnector->dc_link,
-			.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
-
-	edid = drm_dp_mst_get_edid(connector, &aconnector->mst_port->mst_mgr, aconnector->port);
-
-	if (!edid) {
-		drm_mode_connector_update_edid_property(
-			&aconnector->base,
-			NULL);
-		return;
-	}
-
-	aconnector->edid = edid;
-
-	dc_sink = dc_link_add_remote_sink(
-		aconnector->dc_link,
-		(uint8_t *)aconnector->edid,
-		(aconnector->edid->extensions + 1) * EDID_LENGTH,
-		&init_params);
-
-	dc_sink->priv = aconnector;
-	aconnector->dc_sink = dc_sink;
-
-	amdgpu_dm_add_sink_to_freesync_module(
-			connector, aconnector->edid);
-
-	drm_mode_connector_update_edid_property(
-					&aconnector->base, aconnector->edid);
-}
-
 static int dm_dp_mst_get_modes(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
