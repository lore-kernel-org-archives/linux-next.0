From: Jakub Sitnicki <jsitnicki@gmail.com>
Subject: [PATCH] staging: rtl8188eu: Fix build error when CFG80211 is not
 selected
Date: Wed, 23 Sep 2015 23:42:26 +0200
Message-ID: <1443044546-8994-1-git-send-email-jsitnicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Jim Davis <jim.epost@gmail.com>, kbuild test robot <fengguang.wu@intel.com>, kbuild-all@01.org
List-Id: linux-next.vger.kernel.org

The kbuild test robot reports the following build error for
i386-randconfig-c0-09230740:

>> ERROR: "ieee80211_hdrlen" [drivers/staging/rtl8188eu/r8188eu.ko] undefined!

Add a dependency on CFG80211 to fix it.

Signed-off-by: Jakub Sitnicki <jsitnicki@gmail.com>
---

Same issue has also been reported by Jim Davis for
randconfig-1442987837.txt.

 drivers/staging/rtl8188eu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/Kconfig b/drivers/staging/rtl8188eu/Kconfig
index 5a38b41..94f3879 100644
--- a/drivers/staging/rtl8188eu/Kconfig
+++ b/drivers/staging/rtl8188eu/Kconfig
@@ -1,6 +1,6 @@
 config R8188EU
 	tristate "Realtek RTL8188EU Wireless LAN NIC driver"
-	depends on WLAN && USB
+	depends on WLAN && USB && CFG80211
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	---help---
-- 
2.1.0
