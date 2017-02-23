From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm tree
Date: Fri, 24 Feb 2017 10:27:34 +1100
Message-ID: <20170224102734.6acdd963@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34665 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751265AbdBWX1h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Feb 2017 18:27:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

/next/include/drm/drm_gem_cma_helper.h:4:0,
                 from include/drm/tinydrm/tinydrm.h:13,
                 from include/drm/tinydrm/mipi-dbi.h:15,
                 from drivers/gpu/drm/tinydrm/mipi-dbi.c:12:
drivers/gpu/drm/tinydrm/mipi-dbi.c: In function 'mipi_dbi_typec1_command':
drivers/gpu/drm/tinydrm/mipi-dbi.c:65:20: warning: field width specifier '*' expects argument of type 'int', but argument 5 has type 'size_t {aka long unsigned int}' [-Wformat=]
   DRM_DEBUG_DRIVER("cmd=%02x, par=%*ph\n", cmd, len, data); \
                    ^
include/drm/drmP.h:228:40: note: in definition of macro 'DRM_DEBUG_DRIVER'
  drm_printk(KERN_DEBUG, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                        ^
drivers/gpu/drm/tinydrm/mipi-dbi.c:671:2: note: in expansion of macro 'MIPI_DBI_DEBUG_COMMAND'
  MIPI_DBI_DEBUG_COMMAND(cmd, parameters, num);
  ^
drivers/gpu/drm/tinydrm/mipi-dbi.c: In function 'mipi_dbi_typec3_command_read':
drivers/gpu/drm/tinydrm/mipi-dbi.c:65:20: warning: field width specifier '*' expects argument of type 'int', but argument 5 has type 'size_t {aka long unsigned int}' [-Wformat=]
   DRM_DEBUG_DRIVER("cmd=%02x, par=%*ph\n", cmd, len, data); \
                    ^
include/drm/drmP.h:228:40: note: in definition of macro 'DRM_DEBUG_DRIVER'
  drm_printk(KERN_DEBUG, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                        ^
drivers/gpu/drm/tinydrm/mipi-dbi.c:740:2: note: in expansion of macro 'MIPI_DBI_DEBUG_COMMAND'
  MIPI_DBI_DEBUG_COMMAND(cmd, data, len);
  ^
drivers/gpu/drm/tinydrm/mipi-dbi.c: In function 'mipi_dbi_typec3_command':
drivers/gpu/drm/tinydrm/mipi-dbi.c:65:20: warning: field width specifier '*' expects argument of type 'int', but argument 5 has type 'size_t {aka long unsigned int}' [-Wformat=]
   DRM_DEBUG_DRIVER("cmd=%02x, par=%*ph\n", cmd, len, data); \
                    ^
include/drm/drmP.h:228:40: note: in definition of macro 'DRM_DEBUG_DRIVER'
  drm_printk(KERN_DEBUG, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
                                        ^
drivers/gpu/drm/tinydrm/mipi-dbi.c:759:2: note: in expansion of macro 'MIPI_DBI_DEBUG_COMMAND'
  MIPI_DBI_DEBUG_COMMAND(cmd, par, num);
  ^
drivers/gpu/drm/tinydrm/mipi-dbi.c: In function 'mipi_dbi_debugfs_command_write':
drivers/gpu/drm/tinydrm/mipi-dbi.c:905:8: warning: 'cmd' may be used uninitialized in this function [-Wmaybe-uninitialized]
  ret = mipi_dbi_command_buf(mipi, cmd, parameters, i);
        ^
Introduced by commit

  02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")

-- 
Cheers,
Stephen Rothwell
