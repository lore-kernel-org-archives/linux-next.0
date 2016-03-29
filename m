From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Wed, 30 Mar 2016 10:49:25 +1100
Message-ID: <20160330104925.0564904f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40502 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751209AbcC2Xt2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Mar 2016 19:49:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Dave Airlie <airlied@redhat.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_crtc.h

between commit:

  5fff80bbdb6b ("drm/atomic: Allow for holes in connector state, v2.")

from Linus' tree and commit:

  6c87e5c3ec6d ("drm: Rename drm_connector_unplug_all() to drm_connector_unregister_all()")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_crtc.h
index e0170bf80bb0,12f2bd4cf38a..000000000000
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@@ -2254,13 -2252,9 +2254,13 @@@ int drm_connector_register(struct drm_c
  void drm_connector_unregister(struct drm_connector *connector);
  
  extern void drm_connector_cleanup(struct drm_connector *connector);
 -extern unsigned int drm_connector_index(struct drm_connector *connector);
 +static inline unsigned drm_connector_index(struct drm_connector *connector)
 +{
 +	return connector->connector_id;
 +}
 +
- /* helper to unplug all connectors from sysfs for device */
- extern void drm_connector_unplug_all(struct drm_device *dev);
+ /* helper to unregister all connectors from sysfs for device */
+ extern void drm_connector_unregister_all(struct drm_device *dev);
  
  extern int drm_bridge_add(struct drm_bridge *bridge);
  extern void drm_bridge_remove(struct drm_bridge *bridge);
