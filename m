From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] move cd1865.h to drivers/staging/tty/
Date: Thu, 3 Mar 2011 18:38:22 +0100
Message-ID: <201103031838.22541.arnd@arndb.de>
References: <20110303180158.ea30ef45.sfr@canb.auug.org.au> <20110303092927.c06dbbf0.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:52279 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758464Ab1CCRip (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2011 12:38:45 -0500
In-Reply-To: <20110303092927.c06dbbf0.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>

The file is required by the specialix driver, which was
moved to drivers/staging/.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
On Thursday 03 March 2011 18:29:27 Randy Dunlap wrote:
> On Thu, 3 Mar 2011 18:01:58 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110302:
> 
> 
> #include "cd1865.h"
> =>
> linux-next-20110303/drivers/staging/tty/specialix.c:99:20: error: cd1865.h: No such file or directory
> 
> This leads to 100 or so errors.
> 

Please apply or fold this patch.

 drivers/char/cd1865.h       |  263 -------------------------------------------
 drivers/staging/tty/cd1865.h |  263 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 263 insertions(+), 263 deletions(-)

diff --git a/drivers/char/cd1865.h b/drivers/tty/serial/cd1865.h
similarity index 100%
rename from drivers/char/cd1865.h
rename to drivers/staging/tty/cd1865.h
