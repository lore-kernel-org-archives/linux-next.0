From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 15 Dec 2010 22:49:05 -0600
Message-ID: <4D099A41.5090502@lwfinger.net>
References: <20101216142958.e4f463ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020201050903000403070206"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:52309 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639Ab0LPEtK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2010 23:49:10 -0500
In-Reply-To: <20101216142958.e4f463ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020201050903000403070206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2010 09:29 PM, Stephen Rothwell wrote:
> Hi John,
>
> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
>
> drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c: In function 'rtl92c_init_sw_vars':
> drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c:76: error: implicit declaration of function 'vmalloc'
> drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c:76: warning: cast to pointer from integer of different size
> drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c: In function 'rtl92c_deinit_sw_vars':
> drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c:91: error: implicit declaration of function 'vfree'
>
> Caused by commit 0c8173385e549f95cd80c3fff5aab87b4f881d8d ("rtl8192ce:
> Add new driver").  Rule 1 from Documentation/SubmitChecklist.
>
> I have reverted that commit for today.

Sorry for the omission. This error arises because my only platforms get the 
header included implicitly.

This patch will fix the problem - I will formally submit it through John Linville.

Larry
---

Index: wireless-testing/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
===================================================================
--- wireless-testing.orig/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
+++ wireless-testing/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
@@ -27,6 +27,8 @@
   *
   *****************************************************************************/

+#include <linux/vmalloc.h>
+
  #include "../wifi.h"
  #include "../core.h"
  #include "../pci.h"





--------------020201050903000403070206
Content-Type: text/plain;
 name="rtl8192ce_fix_powerpc_build"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rtl8192ce_fix_powerpc_build"

Index: wireless-testing/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
===================================================================
--- wireless-testing.orig/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
+++ wireless-testing/drivers/net/wireless/rtlwifi/rtl8192ce/rtl8192c-sw.c
@@ -27,6 +27,8 @@
  *
  *****************************************************************************/
 
+#include <linux/vmalloc.h>
+
 #include "../wifi.h"
 #include "../core.h"
 #include "../pci.h"



--------------020201050903000403070206--
