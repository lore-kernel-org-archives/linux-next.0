From: =?UTF-8?q?Samuel=20Iglesias=20Gons=C3=A1lvez?=
	<siglesias@igalia.com>
Subject: [PATCH] Staging: ipack: fix build failure in powerpc allyesconfig
Date: Wed,  5 Sep 2012 09:08:17 +0200
Message-ID: <1346828897-31783-1-git-send-email-siglesias@igalia.com>
References: <20120905154801.b21cf25d96767b69489aec29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120905154801.b21cf25d96767b69489aec29@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?q?Samuel=20Iglesias=20Gons=C3=A1lvez?= <siglesias@igalia.com>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Taprogge <jens.taprogge@taprogge.org>, industrypack-devel@lists.sourceforge.net, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

Caused by commit 187e47824013 ("Staging: ipack: Read the ID space durin=
g
device registration").

drivers/staging/ipack/ipack.c: In function 'ipack_device_read_id':
drivers/staging/ipack/ipack.c:291:2: error: implicit declaration of fun=
ction
	'ioread8' [-Werror=3Dimplicit-function-declaration]
drivers/staging/ipack/ipack.c:309:3: error: implicit declaration of fun=
ction
	'ioread16be' [-Werror=3Dimplicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com>
---
 drivers/staging/ipack/ipack.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/ipack/ipack.c b/drivers/staging/ipack/ipac=
k.c
index da9e7bd..8cce6c4 100644
--- a/drivers/staging/ipack/ipack.c
+++ b/drivers/staging/ipack/ipack.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/idr.h>
+#include <asm/io.h>
 #include "ipack.h"
=20
 #define to_ipack_dev(device) container_of(device, struct ipack_device,=
 dev)
--=20
1.7.10.4
