From: Jon Masters <jonathan@jonmasters.org>
Subject: [Fwd: [PULL] hardware latency detector]
Date: Thu, 18 Jun 2009 21:27:11 -0400
Message-ID: <1245374831.14766.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-ySjVfcKaW0J9BwWuVkzk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:52739 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbZFSB13 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2009 21:27:29 -0400
Received: from localhost ([127.0.0.1])
	by dallas.jonmasters.org with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.60)
	(envelope-from <jonathan@jonmasters.org>)
	id 1MHStA-0006kZ-IC
	for linux-next@vger.kernel.org; Fri, 19 Jun 2009 01:27:32 +0000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


--=-ySjVfcKaW0J9BwWuVkzk
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stephen,

I've posted this for merge, but plan to continue developing against the
"master" branch of this tree and then push to "for-linus" before
posting. Perhaps you'd like to add either branch to linux-next.

Jon.


--=-ySjVfcKaW0J9BwWuVkzk
Content-Disposition: inline
Content-Description: Forwarded message - [PULL] hardware latency detector
Content-Type: message/rfc822

Return-path: <jcm@jonmasters.org>
Envelope-to: jcm@jonmasters.org
Delivery-date: Fri, 19 Jun 2009 01:21:43 +0000
Received: from localhost ([127.0.0.1] helo=tonnant) by
 dallas.jonmasters.org with esmtps (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.60) (envelope-from <jcm@jonmasters.org>) id 1MHSnC-0006ig-NV; Fri,
 19 Jun 2009 01:21:22 +0000
Received: from jcm by tonnant with local (Exim 4.69) (envelope-from
 <jcm@jonmasters.org>) id 1MHSnC-0006bC-OW; Thu, 18 Jun 2009 21:21:22 -0400
Date: Thu, 18 Jun 2009 21:21:22 -0400
To: mingo@elte.hu, tglx@linutronix.de, williams@redhat.com, jcm@redhat.com, jcm@jonmasters.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Subject: [PULL] hardware latency detector
User-Agent: Heirloom mailx 12.4 7/29/08
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E1MHSnC-0006bC-OW@tonnant>
From: Jon Masters <jcm@jonmasters.org>
X-SA-Do-Not-Run: Yes
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: jcm@jonmasters.org
X-SA-Exim-Scanned: No (on dallas.jonmasters.org); SAEximRunCond expanded to
 false
Content-Transfer-Encoding: 7bit

Linus,

Please pull "hwlat", the hardware latency detector for 2.6.31.

Patches can be pulled from:

  git://git.kernel.org/pub/scm/linux/kernel/git/jcm/linux-2.6-hwlat.git for-linus

Jon Masters (2):
      hwlat_detector: A system hardware latency detector
      hwlat_detector: include linux/delay.h in hwlat_detector

 Documentation/hwlat_detector.txt |   64 ++
 MAINTAINERS                      |    9 +
 drivers/misc/Kconfig             |   28 +
 drivers/misc/Makefile            |    1 +
 drivers/misc/hwlat_detector.c    | 1208 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 1310 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/hwlat_detector.txt
 create mode 100644 drivers/misc/hwlat_detector.c


--=-ySjVfcKaW0J9BwWuVkzk--
