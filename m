From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: linux-next: acpi tree build failure
Date: Tue, 12 Aug 2008 21:07:54 +0100
Message-ID: <200808122107.55403.carlos@strangeworlds.co.uk>
References: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au> <20080812070658.GY9038@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from phoenix.slamd64.com ([217.10.145.2]:58406 "EHLO
	phoenix.slamd64.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968AbYHLUif (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 16:38:35 -0400
In-Reply-To: <20080812070658.GY9038@one.firstfloor.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, stable@kernel.org

On Tuesday 12 August 2008 08:06:58 Andi Kleen wrote:
> > Clearly, this hasn't even been build tested.  A bit more care, please.
>
> It has, but the ACER_WMI option got disabled for unknown reasons in the
> test builds :/
>
> Thanks, will fix.
>
> -Andi

Looks like my config was screwed up as well. Here's a fixed version of the patch.

-Carlos
---

acer-wmi: Fix wireless and bluetooth on early AMW0 v2 laptops

From: Carlos Corbacho <carlos@strangeworlds.co.uk>

In the old acer_acpi, I discovered that on some of the newer AMW0 laptops
that supported the WMID methods, they don't work properly for setting the
wireless and bluetooth values.

So for the AMW0 V2 laptops, we want to use both the 'old' AMW0 and the
'new' WMID methods for setting wireless & bluetooth to guarantee we always
enable it.

This was fixed in acer_acpi some time ago, but I forgot to port the patch
over to acer-wmi when it was merged.

(Without this patch, early AMW0 V2 laptops such as the Aspire 5040 won't
work with acer-wmi, where-as they did with the old acer_acpi).

v2: Fix compile error

Signed-off-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
CC: stable@kernel.org
---

 drivers/misc/acer-wmi.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)


diff --git a/drivers/misc/acer-wmi.c b/drivers/misc/acer-wmi.c
index e7a3fe5..b2d9878 100644
--- a/drivers/misc/acer-wmi.c
+++ b/drivers/misc/acer-wmi.c
@@ -803,11 +803,30 @@ static acpi_status get_u32(u32 *value, u32 cap)
 
 static acpi_status set_u32(u32 value, u32 cap)
 {
+	acpi_status status;
+
 	if (interface->capability & cap) {
 		switch (interface->type) {
 		case ACER_AMW0:
 			return AMW0_set_u32(value, cap, interface);
 		case ACER_AMW0_V2:
+			if (cap == ACER_CAP_MAILLED)
+				return AMW0_set_u32(value, cap, interface);
+
+			/*
+			 * On some models, some WMID methods don't toggle
+			 * properly. For those cases, we want to run the AMW0
+			 * method afterwards to be certain we've really toggled
+			 * the device state.
+			 */
+			if (cap == ACER_CAP_WIRELESS ||
+				cap == ACER_CAP_BLUETOOTH) {
+				status = WMID_set_u32(value, cap, interface);
+				if (ACPI_FAILURE(status))
+					return status;
+
+				return AMW0_set_u32(value, cap, interface);
+			}
 		case ACER_WMID:
 			return WMID_set_u32(value, cap, interface);
 		default:
