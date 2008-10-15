From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree
Date: Wed, 15 Oct 2008 18:08:54 +1100
Message-ID: <20081015180854.c01ca70f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39722 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751673AbYJOHMZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 03:12:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Jiri Kosina <jkosina@suse.cz>

Hi Dmitry,

Today's linux-next merge of the input tree got a conflict in
Documentation/kernel-parameters.txt between commit
6902aa84f565153ce05f3438ecb8e445d4f468d8 ("doc: Add remaining SH
parameters to kernel-parameters.txt") from the sh tree and commit
36d9573928f9ab126d0089ead7ea5d2ab18fbfa9 ("Input: document i8042.debug in
kernel-parameters.txt") from the input tree.

Just context.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/kernel-parameters.txt
index d564046,88600fe..0000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -824,8 -794,7 +824,9 @@@ and is between 256 and 4096 characters
  			Defaults to the default architecture's huge page size
  			if not specified.
  
 +	hlt		[BUGS=ARM,SH]
 +
+ 	i8042.debug	[HW] Toggle i8042 debug mode
  	i8042.direct	[HW] Put keyboard port into non-translated mode
  	i8042.dumbkbd	[HW] Pretend that controller can only read data from
  			     keyboard and cannot control its state
