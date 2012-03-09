From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: fix for "error: implicit declaration of function 'devres_alloc'"
 in Mar9 tree
Date: Fri, 9 Mar 2012 10:11:56 -0500
Message-ID: <4F5A1DBC.3090701@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:54067 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753703Ab2CIPL6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 10:11:58 -0500
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q29FBvk4003848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-next@vger.kernel.org>; Fri, 9 Mar 2012 07:11:57 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

There are a couple builds showing:

drivers/base/regmap/regmap.c:331: error: implicit declaration of function 'devres_alloc'
drivers/base/regmap/regmap.c:338: error: implicit declaration of function 'devres_add'
drivers/base/regmap/regmap.c:340: error: implicit declaration of function 'devres_free'
drivers/base/regmap/regmap.c:421: error: implicit declaration of function 'dev_err'
make[4]: *** [drivers/base/regmap/regmap.o] Error 1

This is caused by commit 19694b5ea1d3 which just appeared in today's next
tree exposing another implicit device.h user.  Just a quick note that I'll
take care of it by adding regmap.c to the below commit.

Paul.

---

commit 6382876888313b6c9e2002247d9fa24f02835651
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Sun Jan 22 11:23:42 2012 -0500

    device.h: cleanup users outside of linux/include (C files)
    
    For files that are actively using linux/device.h, make sure
    that they call it out.  This will allow us to clean up some
    of the implicit uses of linux/device.h within include/*
    without introducing build regressions.
