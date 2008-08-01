From: Jack Steiner <steiner@sgi.com>
Subject: [PATCH] - Add maintainers for GRU, XPC, XPNET and XP
Date: Fri, 1 Aug 2008 08:15:07 -0500
Message-ID: <20080801131507.GA109173@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.171.29]:45757 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750916AbYHANPJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Aug 2008 09:15:09 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Add MAINTAINERS for GRU, XPNET, XPC and XP drivers.

Signed-off-by: Jack Steiner <steiner@sgi.com>


---
 MAINTAINERS |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: linux/MAINTAINERS
===================================================================
--- linux.orig/MAINTAINERS	2008-07-16 17:48:07.000000000 -0500
+++ linux/MAINTAINERS	2008-08-01 08:06:03.000000000 -0500
@@ -3716,6 +3716,16 @@ L:	linux-visws-devel@lists.sf.net
 W:	http://linux-visws.sf.net
 S:	Maintained for 2.6.
 
+SGI GRU DRIVER
+P:	Jack Steiner
+M:	steiner@sgi.com
+S:	Maintained
+
+SGI XP/XPC/XPNET DRIVER
+P:	Dean Nelson
+M:	dcn@sgi.com
+S:	Maintained
+
 SIMTEC EB110ATX (Chalice CATS)
 P:	Ben Dooks
 P:	Vincent Sanders
