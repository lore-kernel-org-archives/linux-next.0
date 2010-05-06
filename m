From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix ti-st, depends on RFKILL
Date: Thu, 6 May 2010 16:45:10 -0700
Message-ID: <20100506164510.06340a50.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors.  st_kim.c uses rfkill*() interfaces, so it
should depend on RFKILL.

st_kim.c:(.text+0x291b21): undefined reference to `rfkill_unregister'
st_kim.c:(.text+0x291b31): undefined reference to `rfkill_destroy'
st_kim.c:(.text+0x291d8a): undefined reference to `rfkill_alloc'
st_kim.c:(.text+0x291db9): undefined reference to `rfkill_init_sw_state'
st_kim.c:(.text+0x291dc9): undefined reference to `rfkill_register'
st_kim.c:(.text+0x291e07): undefined reference to `rfkill_unregister'
(.text+0x291e85): undefined reference to `rfkill_set_hw_state'
(.text+0x292072): undefined reference to `rfkill_set_hw_state'
(.text+0x2920e1): undefined reference to `rfkill_set_hw_state

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/ti-st/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100506.orig/drivers/staging/ti-st/Kconfig
+++ linux-next-20100506/drivers/staging/ti-st/Kconfig
@@ -5,6 +5,7 @@
 menu "Texas Instruments shared transport line discipline"
 config TI_ST
 	tristate "shared transport core driver"
+	depends on RFKILL
 	select FW_LOADER
 	help
 	  This enables the shared transport core driver for TI
