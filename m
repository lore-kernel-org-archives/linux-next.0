From: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] mfd: Fixup clients of multi_reg_write/register_patch
Date: Fri, 17 Jul 2015 15:09:26 +0100
Message-ID: <20150717140926.GG21939@opensource.wolfsonmicro.com>
References: <20150717143934.4f0ce5d7@canb.auug.org.au> <20150717094436.GC21939@opensource.wolfsonmicro.com> <20150717103450.GJ11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717103450.GJ11162@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Introduced by:
commit 8019ff6cfc04
("regmap: Use reg_sequence for multi_reg_write / register_patch")

Interacting with:
commit 561629755a21 ("mfd: arizona: Add support for WM8998 and WM1814")
commit 81207880cef2 ("mfd: wm5110: Add register patch for rev E and above")

Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
---
 drivers/mfd/wm5110-tables.c | 2 +-
 drivers/mfd/wm8998-tables.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
index 90b84c1..31a132a 100644
--- a/drivers/mfd/wm5110-tables.c
+++ b/drivers/mfd/wm5110-tables.c
@@ -250,7 +250,7 @@ static const struct reg_sequence wm5110_revd_patch[] = {
 };
 
 /* Add extra headphone write sequence locations */
-static const struct reg_default wm5110_reve_patch[] = {
+static const struct reg_sequence wm5110_reve_patch[] = {
 	{ 0x80, 0x3 },
 	{ 0x80, 0x3 },
 	{ 0x4b, 0x138 },
diff --git a/drivers/mfd/wm8998-tables.c b/drivers/mfd/wm8998-tables.c
index 60e8622..73d6842 100644
--- a/drivers/mfd/wm8998-tables.c
+++ b/drivers/mfd/wm8998-tables.c
@@ -21,7 +21,7 @@
 #define WM8998_NUM_AOD_ISR 2
 #define WM8998_NUM_ISR 5
 
-static const struct reg_default wm8998_rev_a_patch[] = {
+static const struct reg_sequence wm8998_rev_a_patch[] = {
 	{ 0x0212, 0x0000 },
 	{ 0x0211, 0x0014 },
 	{ 0x04E4, 0x0E0D },
-- 
2.1.4
