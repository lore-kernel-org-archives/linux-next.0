From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] firmware: fix GOOGLE_SMI kconfig dependency warning
Date: Sun, 22 May 2011 17:38:02 -0700
Message-ID: <20110522173802.c0766c64.randy.dunlap@oracle.com>
References: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Waychison <mikew@google.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Is it meaningful/useful to enable EFI_VARS but not EFI?
That's what GOOGLE_SMI does.  Make it enable EFI also.

Fixes this kconfig dependency warning:

warning: (GOOGLE_SMI) selects EFI_VARS which has unmet direct dependencies (EFI)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Mike Waychison <mikew@google.com>
---
 drivers/firmware/google/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110520.orig/drivers/firmware/google/Kconfig
+++ linux-next-20110520/drivers/firmware/google/Kconfig
@@ -13,6 +13,7 @@ menu "Google Firmware Drivers"
 config GOOGLE_SMI
 	tristate "SMI interface for Google platforms"
 	depends on ACPI && DMI
+	select EFI
 	select EFI_VARS
 	help
 	  Say Y here if you want to enable SMI callbacks for Google
