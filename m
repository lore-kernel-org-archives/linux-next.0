From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: brcm80211 needs lots of delay.h
Date: Wed, 1 Dec 2010 11:16:35 -0800
Message-ID: <20101201111635.3c92ff0f.randy.dunlap@oracle.com>
References: <20101201133354.a7c198b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20101201133354.a7c198b1.sfr@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, driverdevel <devel@driverdev.osuosl.org>
Cc: Dowan Kim <dowan@broadcom.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix lots of errors like:

drivers/staging/brcm80211/phy/wlc_phy_n.c:17613: error: implicit declaration of function 'mdelay'
drivers/staging/brcm80211/util/nicpci.c:246: error: implicit declaration of function 'udelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>
Cc: Henry Ptasinski <henryp@broadcom.com>
Cc: Dowan Kim <dowan@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>
Cc: Arend van Spriel <arend@broadcom.com>
---
 drivers/staging/brcm80211/phy/wlc_phy_cmn.c |    1 +
 drivers/staging/brcm80211/phy/wlc_phy_lcn.c |    1 +
 drivers/staging/brcm80211/phy/wlc_phy_n.c   |    1 +
 drivers/staging/brcm80211/util/aiutils.c    |    1 +
 drivers/staging/brcm80211/util/bcmotp.c     |    1 +
 drivers/staging/brcm80211/util/hndpmu.c     |    1 +
 drivers/staging/brcm80211/util/nicpci.c     |    1 +
 drivers/staging/brcm80211/util/siutils.c    |    1 +
 8 files changed, 8 insertions(+)

--- linux-next-20101201.orig/drivers/staging/brcm80211/phy/wlc_phy_n.c
+++ linux-next-20101201/drivers/staging/brcm80211/phy/wlc_phy_n.c
@@ -18,6 +18,7 @@
 #include <linux/string.h>
 #include <bcmdefs.h>
 #include <wlc_cfg.h>
+#include <linux/delay.h>
 #include <linux/pci.h>
 #include <osl.h>
 #include <siutils.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/util/nicpci.c
+++ linux-next-20101201/drivers/staging/brcm80211/util/nicpci.c
@@ -14,6 +14,7 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/delay.h>
 #include <linux/string.h>
 #include <linux/pci.h>
 #include <bcmdefs.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/util/siutils.c
+++ linux-next-20101201/drivers/staging/brcm80211/util/siutils.c
@@ -14,6 +14,7 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <bcmdefs.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/util/aiutils.c
+++ linux-next-20101201/drivers/staging/brcm80211/util/aiutils.c
@@ -14,6 +14,7 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <bcmdefs.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/util/bcmotp.c
+++ linux-next-20101201/drivers/staging/brcm80211/util/bcmotp.c
@@ -14,6 +14,7 @@
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <bcmdefs.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/util/hndpmu.c
+++ linux-next-20101201/drivers/staging/brcm80211/util/hndpmu.c
@@ -13,6 +13,7 @@
  * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/module.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/phy/wlc_phy_cmn.c
+++ linux-next-20101201/drivers/staging/brcm80211/phy/wlc_phy_cmn.c
@@ -20,6 +20,7 @@
 #include <linux/string.h>
 #include <bcmdefs.h>
 #include <osl.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <bcmendian.h>
--- linux-next-20101201.orig/drivers/staging/brcm80211/phy/wlc_phy_lcn.c
+++ linux-next-20101201/drivers/staging/brcm80211/phy/wlc_phy_lcn.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <wlc_cfg.h>
 #include <qmath.h>
 #include <osl.h>
