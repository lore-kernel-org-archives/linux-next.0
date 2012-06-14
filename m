From: Viresh Kumar <viresh.kumar2@arm.com>
Subject: [PATCH] ARM: netx: Reuse dummy clk routines for non CONFIG_HAVE_CLK
 case
Date: Thu, 14 Jun 2012 09:11:13 +0100
Message-ID: <5c52038c3c8ec3cc6a5468139e886d5e8a1a1f5c.1339661188.git.viresh.kumar2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: akpm@linux-foundation.org
Cc: s.hauer@pengutronix.de, spear-devel@list.st.com, paul.gortmaker@windriver.com, linux-next@vger.kernel.org, viresh.linux@gmail.com, Viresh Kumar <viresh.kumar2@arm.com>, fengguang.wu@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

mach-netx had its own implementation of clk routines like, clk_get{put},
clk_enable{disable}, etc. And with introduction of following patchset:

https://lkml.org/lkml/2012/4/24/154

we get compilation error for multiple definition of these routines.

Sascha had following suggestion to deal with it:

http://www.spinics.net/lists/arm-kernel/msg179369.html

So, removing this code completely.

Signed-off-by: Viresh Kumar <viresh.kumar2@arm.com>
---
 arch/arm/mach-netx/fb.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm/mach-netx/fb.c b/arch/arm/mach-netx/fb.c
index 2cdf6ef..d122ee6 100644
--- a/arch/arm/mach-netx/fb.c
+++ b/arch/arm/mach-netx/fb.c
@@ -69,29 +69,6 @@ void netx_clcd_remove(struct clcd_fb *fb)
                              fb->fb.screen_base, fb->fb.fix.smem_start);
 }

-void clk_disable(struct clk *clk)
-{
-}
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-       return 0;
-}
-
-int clk_enable(struct clk *clk)
-{
-       return 0;
-}
-
-struct clk *clk_get(struct device *dev, const char *id)
-{
-       return dev && strcmp(dev_name(dev), "fb") == 0 ? NULL : ERR_PTR(-ENOENT);
-}
-
-void clk_put(struct clk *clk)
-{
-}
-
 static AMBA_AHB_DEVICE(fb, "fb", 0, 0x00104000, { NETX_IRQ_LCD }, NULL);

 int netx_fb_init(struct clcd_board *board, struct clcd_panel *panel)
--
1.7.11.rc1.9.gf623ca1


-- IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.  Thank you.
