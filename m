From: Guenter Roeck <linux@roeck-us.net>
Subject: next: Build failure in drivers/s390/block/dcssblk.c due to 'dax:
 enable dax ...'
Date: Wed, 18 May 2016 06:30:16 -0700
Message-ID: <573C6E68.4060209@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54931 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbcERNaT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2016 09:30:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>

drivers/s390/block/dcssblk.c:43:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/s390/block/dcssblk.c:43:2: warning: (near initialization for 'dcssblk_devops.direct_access') [enabled by default]
drivers/s390/block/dcssblk.c:886:1: error: conflicting types for 'dcssblk_direct_access'
drivers/s390/block/dcssblk.c:33:13: note: previous declaration of 'dcssblk_direct_access' was here
drivers/s390/block/dcssblk.c:33:13: warning: 'dcssblk_direct_access' used but never defined [enabled by default]
drivers/s390/block/dcssblk.c:886:1: warning: 'dcssblk_direct_access' defined but not used [-Wunused-function]
scripts/Makefile.build:295: recipe for target 'drivers/s390/block/dcssblk.o' failed
make[2]: *** [drivers/s390/block/dcssblk.o] Error 1

Bisect points to commit 2b954df309078 ("dax: enable dax in the presence of known media errors (badblocks)".
Bisect log is attached.

Guenter

---
# bad: [621a2a0fb6688af5dce47d60a6d4b5a19ae2c2e4] Add linux-next specific files for 20160518
# good: [2dcd0af568b0cf583645c8a317dd12e344b1c72a] Linux 4.6
git bisect start 'HEAD' 'v4.6'
# good: [586cf328ff7e7c0c32f89d6f2063c81143802c01] Merge remote-tracking branch 'net-next/master'
git bisect good 586cf328ff7e7c0c32f89d6f2063c81143802c01
# good: [69bf2b19c358d937a3f40c07a08bc73476d43c02] Merge remote-tracking branch 'tty/tty-next'
git bisect good 69bf2b19c358d937a3f40c07a08bc73476d43c02
# good: [cc6ecde352ff6cda50e204a4d942e742151027dc] Merge remote-tracking branch 'extcon/extcon-next'
git bisect good cc6ecde352ff6cda50e204a4d942e742151027dc
# good: [d217278c0fbbdd5bd89a02d763bcf1e8eeaa018d] Merge remote-tracking branch 'clk/clk-next'
git bisect good d217278c0fbbdd5bd89a02d763bcf1e8eeaa018d
# good: [6a9d815c7883e262876188ba0569fa049db8f801] radix-tree: remove root->height
git bisect good 6a9d815c7883e262876188ba0569fa049db8f801
# good: [f649c3f1360929e607c6d9c5f8b4a8a7c437af47] Merge remote-tracking branch 'nvdimm/libnvdimm-for-next'
git bisect good f649c3f1360929e607c6d9c5f8b4a8a7c437af47
# good: [e386a22cafdab311d0538c3eae8e227428f88c14] rtsx_usb_ms: use schedule_timeout_idle() in polling loop
git bisect good e386a22cafdab311d0538c3eae8e227428f88c14
# bad: [d0a783895690d227fb7cadc5482d787fb44fd425] Merge branch 'akpm-current/current'
git bisect bad d0a783895690d227fb7cadc5482d787fb44fd425
# good: [a758ba8622449cb31893a0030d0dada82cfb9315] ipc/msg.c: use freezable blocking call
git bisect good a758ba8622449cb31893a0030d0dada82cfb9315
# good: [87eefeb4e80b1526be83e670a08d059a003b7d0e] ext4: Add alignment check for DAX mount
git bisect good 87eefeb4e80b1526be83e670a08d059a003b7d0e
# bad: [2b954df30907837661f5612cf8bd4c21ab80403b] dax: enable dax in the presence of known media errors (badblocks)
git bisect bad 2b954df30907837661f5612cf8bd4c21ab80403b
# good: [1e937cddd1ff4b823fc9d148ebabd443f105211e] xfs: Add alignment check for DAX mount
git bisect good 1e937cddd1ff4b823fc9d148ebabd443f105211e
# good: [8b3db9798c689ba2dc509f6ca1a8c7e1c1a3e62a] dax: fallback from pmd to pte on error
git bisect good 8b3db9798c689ba2dc509f6ca1a8c7e1c1a3e62a
# first bad commit: [2b954df30907837661f5612cf8bd4c21ab80403b] dax: enable dax in the presence of known media errors (badblocks)
