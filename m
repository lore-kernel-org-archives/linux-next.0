From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] drm/radeon/dpm: Add missing #include <linux/seq_file.h>
Date: Fri,  5 Jul 2013 13:25:28 +0200
Message-ID: <1373023528-3361-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

ia64_defconfig:

drivers/gpu/drm/radeon/rv6xx_dpm.c: In function 'rv6xx_dpm_debugfs_print_current_performance_level':
drivers/gpu/drm/radeon/rv6xx_dpm.c:2041:3: error: implicit declaration of function 'seq_printf' [-Werror=implicit-function-declaration]

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/9068726/

 drivers/gpu/drm/radeon/rv6xx_dpm.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.c b/drivers/gpu/drm/radeon/rv6xx_dpm.c
index 33705c5..0d09677 100644
--- a/drivers/gpu/drm/radeon/rv6xx_dpm.c
+++ b/drivers/gpu/drm/radeon/rv6xx_dpm.c
@@ -22,6 +22,7 @@
  * Authors: Alex Deucher
  */
 
+#include <linux/seq_file.h>
 #include "drmP.h"
 #include "radeon.h"
 #include "rv6xxd.h"
-- 
1.7.9.5
