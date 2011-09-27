From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Tue, 27 Sep 2011 16:10:55 +1000
Message-ID: <20110927161055.05bbb0586fffbfbb2307f30b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:51569 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869Ab1I0GLG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 02:11:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, "Igor M. Liplianin" <liplianin@netup.ru>, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/misc/altera-stapl/altera.c between commit cff4fa8415a3 ("[media]
altera-stapl: it is time to move out from staging") from the v4l-dvb tree
and commit 99c978529a40 ("staging: Add module.h to drivers/staging
users") from the staging tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.

Mauro, you could, of course, apply Paul's patch to the file in its new
location.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/misc/altera-stapl/altera.c
index 1a2c50b,c2eff6a..0000000
--- a/drivers/misc/altera-stapl/altera.c
+++ b/drivers/misc/altera-stapl/altera.c
@@@ -28,7 -28,8 +28,8 @@@
  #include <linux/string.h>
  #include <linux/firmware.h>
  #include <linux/slab.h>
+ #include <linux/module.h>
 -#include "altera.h"
 +#include <misc/altera.h>
  #include "altera-exprt.h"
  #include "altera-jtag.h"
  
