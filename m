From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 12 Aug 2015 09:48:34 +1000
Message-ID: <20150812094834.0b0b2af1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46525 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932265AbbHKXsg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Aug 2015 19:48:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/kernel/psci.c

between commit:

  be120397e770 ("ARM: migrate to common PSCI client code")

from the arm tree and commit:

  19c233b79d1a ("ARM: appropriate __init annotation for const data")

from the arm-soc tree.

I fixed it up (the former removed the file, so I did that, then added
the following patch) and can carry the fix as necessary (no action
is required).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Aug 2015 09:39:15 +1000
Subject: [PATCH] ARM: fix for PSCI code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/firmware/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index a6956007dd38..42700f09a8c5 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -337,7 +337,7 @@ out_put_node:
 	return err;
 }
 
-static const struct of_device_id psci_of_match[] __initconst = {
+static const struct of_device_id const psci_of_match[] __initconst = {
 	{ .compatible = "arm,psci",	.data = psci_0_1_init},
 	{ .compatible = "arm,psci-0.2",	.data = psci_0_2_init},
 	{},
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
