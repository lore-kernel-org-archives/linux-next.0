From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: [PATCH] export of_reconfig_notifier_[register,unregister]
Date: Wed, 28 Nov 2012 13:42:26 -0600
Message-ID: <50B66922.9090209@linux.vnet.ibm.com>
References: <20121128140308.abb21ec8f61553a2ed077fe3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:43245 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755536Ab2K1Tmf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Nov 2012 14:42:35 -0500
Received: from /spool/local
	by e5.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <nfont@linux.vnet.ibm.com>;
	Wed, 28 Nov 2012 14:42:31 -0500
In-Reply-To: <20121128140308.abb21ec8f61553a2ed077fe3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>

The of reconfiguration notification chains should be exported for use
by modules.

Signed-off-by:Nathan Fontenot <nfont@linux.vnet.ibm.com>
---
Index: linux-next/drivers/of/base.c
===================================================================
--- linux-next.orig/drivers/of/base.c	2012-11-28 09:18:02.000000000 -0600
+++ linux-next/drivers/of/base.c	2012-11-28 11:05:00.000000000 -0600
@@ -1282,11 +1282,13 @@
 {
 	return blocking_notifier_chain_register(&of_reconfig_chain, nb);
 }
+EXPORT_SYMBOL_GPL(of_reconfig_notifier_register);
 
 int of_reconfig_notifier_unregister(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_unregister(&of_reconfig_chain, nb);
 }
+EXPORT_SYMBOL_GPL(of_reconfig_notifier_unregister);
 
 int of_reconfig_notify(unsigned long action, void *p)
 {
