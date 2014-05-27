From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: randconfig build error with next-20140527,
 in drivers/staging/rtl8192ee
Date: Tue, 27 May 2014 13:15:38 -0500
Message-ID: <5384D64A.8040603@lwfinger.net>
References: <CA+r1Zhg+XHZrgK73ucpSG4gsVpCR1xzh6LzCek0-CQ8woK5TKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090704010600060209040804"
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CA+r1Zhg+XHZrgK73ucpSG4gsVpCR1xzh6LzCek0-CQ8woK5TKw@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel <devel@driverdev.osuosl.org>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------090704010600060209040804
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 12:27 PM, Jim Davis wrote:
> Building with the attached random configuration file,

A problem with the build when PCI is not selected was reported yesterday. I 
think this build error is caused by MAC80211 not being selected. The fix for 
both problems was merged as commit 42e4c20f114c71e12cdf35d9b5dd60d2546c7d57 
yesterday in staging-next. If it has not reached linux-next, the attached patch 
should fix the problem.

Thanks,

Larry



--------------090704010600060209040804
Content-Type: text/x-patch;
 name="0002-staging-r8192ee-Fix-build-errors-when-PCI-is-not-ava.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-staging-r8192ee-Fix-build-errors-when-PCI-is-not-ava.pa";
 filename*1="tch"

>From d10ca90ffaf99f43bb61d5b4001f6a6acfde3454 Mon Sep 17 00:00:00 2001
From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 26 May 2014 13:35:48 -0500
Subject: [PATCH 2/3] staging: r8192ee: Fix build errors when PCI is not
 available
To: gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
    devel@driverdev.osuosl.org

A build of this driver fails when PCI is not selected. It would also
fail if MAC80211 is not selected. Kconfig is fixed to handle these
conditions, and to select additional necessary components.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/rtl8192ee/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8192ee/Kconfig b/drivers/staging/rtl8192ee/Kconfig
index 92c5f44..beb07ac2 100644
--- a/drivers/staging/rtl8192ee/Kconfig
+++ b/drivers/staging/rtl8192ee/Kconfig
@@ -1,6 +1,13 @@
 config R8192EE
 	tristate "Realtek RTL8192EE Wireless Network Adapter"
+	depends on PCI && WLAN && MAC80211
+	depends on m
+	select WIRELESS_EXT
+	select WEXT_PRIV
+	select EEPROM_93CX6
+	select CRYPTO
 	select FW_LOADER
+	default N
 	---help---
 	This is the driver for Realtek RTL8192EE 802.11 PCIe
 	wireless network adapters.
-- 
1.8.4.5


--------------090704010600060209040804
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--------------090704010600060209040804--
