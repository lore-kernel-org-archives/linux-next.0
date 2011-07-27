From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] firmware: fix google/gsmi.c build warning
Date: Wed, 27 Jul 2011 10:11:28 -0700
Message-ID: <20110727101128.8d63fbab.rdunlap@xenotime.net>
References: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:53108 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754919Ab1G0RLa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2011 13:11:30 -0400
In-Reply-To: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Waychison <mikew@google.com>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Modify function parameter type to match expected type.  Fixes a
build warning:

drivers/firmware/google/gsmi.c:473: warning: initialization from incompatible pointer type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Mike Waychison <mikew@google.com>
---
 drivers/firmware/google/gsmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110727.orig/drivers/firmware/google/gsmi.c
+++ linux-next-20110727/drivers/firmware/google/gsmi.c
@@ -420,7 +420,7 @@ static efi_status_t gsmi_get_next_variab
 
 static efi_status_t gsmi_set_variable(efi_char16_t *name,
 				      efi_guid_t *vendor,
-				      unsigned long attr,
+				      u32 attr,
 				      unsigned long data_size,
 				      void *data)
 {
