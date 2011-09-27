From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the moduleh tree with the v4l-dvb tree
Date: Tue, 27 Sep 2011 16:26:31 +1000
Message-ID: <20110927162631.417358545666d197ab9df323@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:50667 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029Ab1I0G0e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 02:26:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Patrick Boettcher <Patrick.Boettcher@dibcom.fr>, Mauro Carvalho Chehab <mchehab@infradead.org>

Hi Paul,

Today's linux-next merge of the moduleh tree got a conflict in
drivers/media/dvb/frontends/dibx000_common.c between commit 79fcce3230b1
("[media] DiBcom: protect the I2C bufer access") from the v4l-dvb tree
and commit 32ee0bf69471 ("drivers/media: Add module.h to all files using
it implicitly") from the moduleh tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/media/dvb/frontends/dibx000_common.c
index 774d507,977211f..0000000
--- a/drivers/media/dvb/frontends/dibx000_common.c
+++ b/drivers/media/dvb/frontends/dibx000_common.c
@@@ -1,5 -1,5 +1,6 @@@
  #include <linux/i2c.h>
 +#include <linux/mutex.h>
+ #include <linux/module.h>
  
  #include "dibx000_common.h"
  
