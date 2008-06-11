From: Ivo van Doorn <ivdoorn@gmail.com>
Subject: Re: [Rt2400-devel] next-20080611 rt2x00: build failure
Date: Wed, 11 Jun 2008 19:48:48 +0200
Message-ID: <200806111948.49976.IvDoorn@gmail.com>
References: <20080611100748.d35829f4.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:14107 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754111AbYFKRgk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 13:36:40 -0400
Received: by yx-out-2324.google.com with SMTP id 31so357684yxl.1
        for <linux-next@vger.kernel.org>; Wed, 11 Jun 2008 10:36:39 -0700 (PDT)
In-Reply-To: <20080611100748.d35829f4.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rt2400-devel@lists.sourceforge.net
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, linux-wireless@vger.kernel.org

> when CONFIG_INPUT=n and
> # CONFIG_NEW_LEDS is not set
> CONFIG_LEDS_CLASS=y

Does below patch help?

---
diff --git a/drivers/net/wireless/rt2x00/Kconfig b/drivers/net/wireless/rt2x00/Kconfig
index 0ace761..c4d1f67 100644
--- a/drivers/net/wireless/rt2x00/Kconfig
+++ b/drivers/net/wireless/rt2x00/Kconfig
@@ -36,6 +36,7 @@ config RT2X00_LIB_FIRMWARE
 config RT2X00_LIB_RFKILL
 	boolean
 	depends on RT2X00_LIB
+	depends on INPUT
 	select RFKILL
 	select INPUT_POLLDEV
 
