From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Wed, 10 Feb 2016 12:24:51 +1100
Message-ID: <20160210122451.55391e43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57730 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755624AbcBJBYx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Feb 2016 20:24:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Darren Hart <dvhart@linux.intel.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:25:0:
include/linux/apple-gmux.h: In function 'apple_gmux_present':
include/linux/apple-gmux.h:36:42: error: implicit declaration of function 'acpi_dev_present' [-Werror=implicit-function-declaration]
  return IS_ENABLED(CONFIG_APPLE_GMUX) && acpi_dev_present(GMUX_ACPI_HID);
                                          ^

Caused by commit

  2413306c2566 ("apple-gmux: Add helper for presence detect")

I have used the drm-misc tree from next-20160209 for today.

-- 
Cheers,
Stephen Rothwell
