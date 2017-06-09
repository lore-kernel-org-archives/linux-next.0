From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] thermal: int340x_thermal: Switch to use new generic UUID API
Date: Fri,  9 Jun 2017 11:33:06 +0300
Message-ID: <20170609083306.83431-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

There are new types and helpers that are supposed to be used in
new code.

As a preparation to get rid of legacy types and API functions do
the conversion here.

The conversion fixes a potential bug in int340x_thermal as well
since we have to use memcmp() on binary data.

Acked-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/thermal/int340x_thermal/int3400_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/int340x_thermal/int3400_thermal.c b/drivers/thermal/int340x_thermal/int3400_thermal.c
index 9413c4abf0b9..fb7284153878 100644
--- a/drivers/thermal/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/int340x_thermal/int3400_thermal.c
@@ -23,7 +23,7 @@ enum int3400_thermal_uuid {
 	INT3400_THERMAL_MAXIMUM_UUID,
 };
 
-static u8 *int3400_thermal_uuids[INT3400_THERMAL_MAXIMUM_UUID] = {
+static const char *int3400_thermal_uuids[INT3400_THERMAL_MAXIMUM_UUID] = {
 	"42A441D6-AE6A-462b-A84B-4A8CE79027D3",
 	"3A95C389-E4B8-4629-A526-C52C88626BAE",
 	"97C68AE7-15FA-499c-B8C9-5DA81D606E0A",
@@ -141,10 +141,10 @@ static int int3400_thermal_get_uuids(struct int3400_thermal_priv *priv)
 		}
 
 		for (j = 0; j < INT3400_THERMAL_MAXIMUM_UUID; j++) {
-			u8 uuid[16];
+			guid_t guid;
 
-			acpi_str_to_uuid(int3400_thermal_uuids[j], uuid);
-			if (!strncmp(uuid, objb->buffer.pointer, 16)) {
+			guid_parse(int3400_thermal_uuids[j], &guid);
+			if (guid_equal(objb->buffer.pointer, &guid)) {
 				priv->uuid_bitmap |= (1 << j);
 				break;
 			}
-- 
2.11.0
