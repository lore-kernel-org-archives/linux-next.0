From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] Bluetooth: depends on RFKILL
Date: Tue,  9 Jun 2009 19:07:40 +0400
Message-ID: <1244560060-28112-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:46780 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbZFIPHy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 11:07:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: marcel@holtmann.org, linux-next@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Since commit "Bluetooth: Add native RFKILL soft-switch support for all
devices" (611b30f74b5) bluetooth depends on RFKILL.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 net/bluetooth/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index 7725da9..85ec71d 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -3,7 +3,7 @@
 #
 
 menuconfig BT
-	depends on NET && !S390
+	depends on NET && RFKILL && !S390
 	tristate "Bluetooth subsystem support"
 	help
 	  Bluetooth is low-cost, low-power, short-range wireless technology.
-- 
1.6.3.1
