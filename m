From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: "usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt"
 breaks sparc
Date: Fri, 2 Mar 2012 17:01:16 -0500
Message-ID: <4F51432C.8020204@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:64814 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754720Ab2CBWBe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Mar 2012 17:01:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tomoya.rohm@gmail.com, Felipe Balbi <balbi@ti.com>
Cc: linux-next@vger.kernel.org

This commit:

---------------
commit 637b78eb31e0b167ed913f1750bb645dfeda38f0
Author: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Date:   Fri Feb 3 16:14:18 2012 +0900

    usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt
    
    Problem:
     pch_udc continues operation even if VBUS becomes Low.
     pch_udc performs D+ pulling up before VBUS becomes High.
     USB device should be controlled according to VBUS state.
    
    Root cause:
     The current pch_udc is not always monitoring VBUS.
    
    Solution:
     The change of VBUS is detected using an interrupt of GPIO.
     If VBUS became Low, pch_udc handles 'disconnect'.
     After VBUS became High, a pull improves D+, and pch_udc
     handles 'connect'.
    
    [ balbi@ti.com : make it actually compile ]
    
    Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
    Signed-off-by: Felipe Balbi <balbi@ti.com>
---------------

breaks the sparc builds in next:

http://kisskb.ellerman.id.au/kisskb/buildresult/5771890/
http://kisskb.ellerman.id.au/kisskb/buildresult/5771905/

Thanks,
Paul.
