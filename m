From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the pm tree
Date: Mon, 14 Nov 2016 13:09:02 +1100
Message-ID: <20161114130902.532c3c64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/base/power/main.c

between commit:

  6f75c3fd56da ("PM / sleep: don't suspend parent when async child suspend_{noirq, late} fails")

from the pm tree and commit:

  8c73b4288496 ("PM / sleep: Make async suspend/resume of devices use device links")

from the driver-core tree.

I fixed it up (maybe .. see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/base/power/main.c
index 2932a5bd892f,04bcb11ed8de..000000000000
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@@ -1027,8 -1085,6 +1085,8 @@@ static int __device_suspend_noirq(struc
  	TRACE_DEVICE(dev);
  	TRACE_SUSPEND(0);
  
- 	dpm_wait_for_children(dev, async);
++	dpm_wait_for_subordinate(dev, async);
 +
  	if (async_error)
  		goto Complete;
  
@@@ -1174,8 -1232,6 +1232,8 @@@ static int __device_suspend_late(struc
  
  	__pm_runtime_disable(dev, false);
  
- 	dpm_wait_for_children(dev, async);
++	dpm_wait_for_subordinate(dev, async);
 +
  	if (async_error)
  		goto Complete;
  
