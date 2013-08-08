From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Build break due to 28ec711 "drm/agp: move AGP cleanup paths to drm_agpsupport.c"
Date: Thu, 08 Aug 2013 12:00:16 -0600
Message-ID: <5203DCB0.9060409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33999 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab3HHSAT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 14:00:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>

In next-20130808, building tegra_defconfig for ARM yields:

> drivers/built-in.o: In function `drm_lastclose':
> /home/swarren/shared/git_wa/kernel/kernel.git/drivers/gpu/drm/drm_drv.c:198: undefined reference to `drm_agp_clear'

That's because drm_agp_clear() is called unconditionally, yet is only
conditionally built into drm_agpsupport.c (#if __OS_HAS_AGP).

Should the call from drm_drv.c be conditional, or should there be a
dummy static inline replacement in include/drm/drmP.h for when AGP
support isn't available?
