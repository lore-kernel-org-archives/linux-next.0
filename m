From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 17 Jul 2015 14:25:01 +1000
Message-ID: <20150717142501.0239bd93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/soc/sti/sti_uniperif.c: In function 'sti_uniperiph_dai_suspend':
sound/soc/sti/sti_uniperif.c:81:2: error: implicit declaration of function 'pinctrl_pm_select_sleep_state' [-Werror=implicit-function-declaration]
  ret = pinctrl_pm_select_sleep_state(uni->dev);
  ^
sound/soc/sti/sti_uniperif.c: In function 'sti_uniperiph_dai_resume':
sound/soc/sti/sti_uniperif.c:102:2: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror=implicit-function-declaration]
  ret = pinctrl_pm_select_default_state(uni->dev);
  ^

Caused by commit

  f3bd847eb0a7 ("ASoC: sti: Add uniperipheral dai driver")

I have added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Jul 2015 14:21:37 +1000
Subject: [PATCH] ASoC: sti: included needed header file

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/sti/sti_uniperif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index 749e6b294184..ab8d36af6dcb 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 
 #include "uniperif.h"
 
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
