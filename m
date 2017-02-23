From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Fri, 24 Feb 2017 10:25:35 +1100
Message-ID: <20170224102535.6bd7a69a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>
List-Id: linux-next.vger.kernel.org

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:198:26: error: redefinition of 'tinydrm_of_find_backlight'
 struct backlight_device *tinydrm_of_find_backlight(struct device *dev)
                          ^
In file included from drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:11:0:
include/drm/tinydrm/tinydrm-helpers.h:53:1: note: previous definition of 'tinydrm_of_find_backlight' was here
 tinydrm_of_find_backlight(struct device *dev)
 ^
drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:230:5: error: redefinition of 'tinydrm_enable_backlight'
 int tinydrm_enable_backlight(struct backlight_device *backlight)
     ^
In file included from drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:11:0:
include/drm/tinydrm/tinydrm-helpers.h:58:19: note: previous definition of 'tinydrm_enable_backlight' was here
 static inline int tinydrm_enable_backlight(struct backlight_device *backlight)
                   ^
drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:258:5: error: redefinition of 'tinydrm_disable_backlight'
 int tinydrm_disable_backlight(struct backlight_device *backlight)
     ^
In file included from drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c:11:0:
include/drm/tinydrm/tinydrm-helpers.h:64:1: note: previous definition of 'tinydrm_disable_backlight' was here
 tinydrm_disable_backlight(struct backlight_device *backlight)
 ^

Caused by commit

  9f69eb5c36a6 ("drm/tinydrm: Add helper functions")

I have used the drm tree from next-20170223 for today.

-- 
Cheers,
Stephen Rothwell
