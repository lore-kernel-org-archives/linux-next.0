From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Tue, 12 Aug 2008 13:16:13 +1000
Message-ID: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48395 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753380AbYHLDQU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Aug 2008 23:16:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, stable@kernel.org

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/misc/acer-wmi.c: In function 'set_u32':
drivers/misc/acer-wmi.c:831: error: 'status' undeclared (first use in this function)

Caused by commit 70ea586cc54ab2fb2af42d7ee97ba4f26e315f45 ("acer-wmi: Fix
wireless and bluetooth on early AMW0 v2 laptops").

Clearly, this hasn't even been build tested.  A bit more care, please.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Aug 2008 13:10:47 +1000
Subject: [PATCH] acpi: missing status declaration in acer-wmi.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/misc/acer-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/misc/acer-wmi.c b/drivers/misc/acer-wmi.c
index 894990f..6df52e8 100644
--- a/drivers/misc/acer-wmi.c
+++ b/drivers/misc/acer-wmi.c
@@ -812,6 +812,8 @@ static acpi_status get_u32(u32 *value, u32 cap)
 
 static acpi_status set_u32(u32 value, u32 cap)
 {
+	acpi_status status;
+
 	if (interface->capability & cap) {
 		switch (interface->type) {
 		case ACER_AMW0:
-- 
1.5.6.3
