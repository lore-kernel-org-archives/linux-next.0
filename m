From: Joe Perches <joe@perches.com>
Subject: [linux-next PATCH] MAINTAINERS: Generic UIO use M: "Michael S.
 Tsirkin" <mst@redhat.com>
Date: Tue, 15 Sep 2009 00:23:44 -0700
Message-ID: <1252999424.19910.6.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1187 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758170AbZIOHXm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 03:23:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi Michael.

Your new entry needs to be updated a bit.
The P: entry is deprecated and M: is used for "name" <address>

Your name also needs to be quoted so people can copy/paste
it and that scripts/get_maintainer.pl works.

cheers, Joe

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 70ca14b..1246238 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2237,7 +2237,7 @@ S:	Maintained
 F:	include/asm-generic
 
 GENERIC UIO DRIVER FOR PCI DEVICES
-P:	Michael S. Tsirkin <mst@redhat.com>
+M:	"Michael S. Tsirkin" <mst@redhat.com>
 L:	kvm@vger.kernel.org
 L:	linux-kernel@vger.kernel.org
 S:	Supported
