From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the moduleh tree
Date: Fri, 29 Jul 2011 15:30:00 +1000
Message-ID: <20110729153000.673ad0490d8308bd03870ffd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bastian Hecht <hechtb@googlemail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

After merging the moduleh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/video/ov5642.c:985:1: warning: data definition has no type or storage class
drivers/media/video/ov5642.c:985:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
drivers/media/video/ov5642.c:985:1: warning: parameter names (without types) in function declaration
drivers/media/video/ov5642.c: In function 'ov5642_mod_init':
drivers/media/video/ov5642.c:998:9: error: 'THIS_MODULE' undeclared (first use in this function)
drivers/media/video/ov5642.c:998:9: note: each undeclared identifier is reported only once for each function it appears in
drivers/media/video/ov5642.c: At top level:
drivers/media/video/ov5642.c:1009:20: error: expected declaration specifiers or '...' before string constant
drivers/media/video/ov5642.c:1009:1: warning: data definition has no type or storage class
drivers/media/video/ov5642.c:1009:1: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
drivers/media/video/ov5642.c:1009:20: warning: function declaration isn't a prototype
drivers/media/video/ov5642.c:1010:15: error: expected declaration specifiers or '...' before string constant
drivers/media/video/ov5642.c:1010:1: warning: data definition has no type or storage class
drivers/media/video/ov5642.c:1010:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/media/video/ov5642.c:1010:15: warning: function declaration isn't a prototype
drivers/media/video/ov5642.c:1011:16: error: expected declaration specifiers or '...' before string constant
drivers/media/video/ov5642.c:1011:1: warning: data definition has no type or storage class
drivers/media/video/ov5642.c:1011:1: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
drivers/media/video/ov5642.c:1011:16: warning: function declaration isn't a prototype
drivers/media/video/ov5642.c: In function 'ov5642_mod_init':
drivers/media/video/ov5642.c:999:1: warning: control reaches end of non-void function

This is an interaction with the v4l-dvb tree.

I have added the following patch for today (Mauro, this could go into
your tree):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Jul 2011 15:28:23 +1000
Subject: [PATCH] ov5642: include module.h for its facilities

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/video/ov5642.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/ov5642.c b/drivers/media/video/ov5642.c
index 3cdae97..349a4ad 100644
--- a/drivers/media/video/ov5642.c
+++ b/drivers/media/video/ov5642.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <linux/module.h>
 
 #include <media/soc_camera.h>
 #include <media/soc_mediabus.h>
-- 
1.7.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
