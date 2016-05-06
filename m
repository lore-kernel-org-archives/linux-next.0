From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 6 May 2016 10:57:39 +1000
Message-ID: <20160506105739.43ae3afd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37980 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755262AbcEFA5m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 May 2016 20:57:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/da7219.c:1964:23: error: implicit declaration of function 'ACPI_PTR' [-Werror=implicit-function-declaration]
   .acpi_match_table = ACPI_PTR(da7219_acpi_match),
                       ^
sound/soc/codecs/da7219.c:1964:23: error: initializer element is not constant
sound/soc/codecs/da7219.c:1964:23: note: (near initialization for 'da7219_i2c_driver.driver.acpi_match_table')

Caused by commit

  5181365f5312 ("ASoC: da7219: Add initial ACPI id for device")

I added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 May 2016 10:52:45 +1000
Subject: [PATCH] ASoC: da7219: include acpi.h for ACPI_PTR

Fixed: 5181365f5312 ("ASoC: da7219: Add initial ACPI id for device")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/codecs/da7219.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 17e2119f211b..1d9f4ff4355a 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
+#include <linux/acpi.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
