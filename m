From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Fri, 10 Mar 2017 11:03:14 +1100
Message-ID: <20170310110314.1f74dfe0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752943AbdCJADR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Mar 2017 19:03:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/gpu/drm/drm_pci.c:29:0:
include/drm/drm_pci.h:76:64: warning: 'struct platform_device' declared inside parameter list
 extern int drm_platform_init(struct drm_driver *driver, struct platform_device *platform_device);
                                                                ^
include/drm/drm_pci.h:76:64: warning: its scope is only this definition or declaration, which is probably not what you want

Introduced by commit

  23ef59ef6dcc ("drm: Extract drm_pci.h")

A forgotten include file (or maybe just a forward declaration of the struct).

-- 
Cheers,
Stephen Rothwell
