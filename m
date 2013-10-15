From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] [media] staging: media: Fix build for iMON LIRC driver
Date: Tue, 15 Oct 2013 16:02:43 +0200
Message-ID: <1381845763-10487-3-git-send-email-treding@nvidia.com>
References: <1381845763-10487-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1381845763-10487-1-git-send-email-treding@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Archana kumari <archanakumari959@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Add a missing , between parameters in a call to dev_info().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/media/lirc/lirc_imon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/lirc/lirc_imon.c b/drivers/staging/media/lirc/lirc_imon.c
index 8180187..91c3e2d 100644
--- a/drivers/staging/media/lirc/lirc_imon.c
+++ b/drivers/staging/media/lirc/lirc_imon.c
@@ -925,7 +925,7 @@ static int imon_probe(struct usb_interface *interface,
 		if (usb_register_dev(interface, &imon_class)) {
 			/* Not a fatal error, so ignore */
 			dev_info(dev,
-			       "%s: could not get a minor number for display\n"
+			       "%s: could not get a minor number for display\n",
 						__func__);
 		}
 	}
-- 
1.8.4
