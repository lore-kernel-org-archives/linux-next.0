From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Fri, 12 Sep 2008 13:53:11 +1000
Message-ID: <20080912135311.c7d43744.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34813 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752341AbYILDxT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 23:53:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/wireless/atmel_cs.c: In function 'atmel_config':
drivers/net/wireless/atmel_cs.c:237: error: incompatible type for argument 1 of 'dev_get_drvdata'

Introduced by commit 107aeb9753159da848f066b26557f0aaab900a90 ("Driver
core: Use dev_get_drvdata() accessors").  handle_to_dev returns a struct
device not a struct device *.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Sep 2008 13:50:07 +1000
Subject: [PATCH] driver-core: atmel_cs.c fixup

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/atmel_cs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/atmel_cs.c b/drivers/net/wireless/atmel_cs.c
index 9b002cc..8ef37d0 100644
--- a/drivers/net/wireless/atmel_cs.c
+++ b/drivers/net/wireless/atmel_cs.c
@@ -234,7 +234,7 @@ static int atmel_config(struct pcmcia_device *link)
 	struct pcmcia_device_id *did;
 
 	dev = link->priv;
-	did = dev_get_drvdata(handle_to_dev(link));
+	did = dev_get_drvdata(&handle_to_dev(link));
 
 	DEBUG(0, "atmel_config(0x%p)\n", link);
 
-- 
1.5.6.3
