From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: "ahci: per-port msix support" and ARM omap2plus_defconfig
Date: Fri, 27 Nov 2015 13:54:43 -0500
Message-ID: <CAP=VYLqT2MiaziwtewRto+JeNx0CcMjQ=q28FN1fVNTvt224eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37313 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755017AbbK0SzO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2015 13:55:14 -0500
Received: by wmww144 with SMTP id w144so68071523wmw.0
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2015 10:55:13 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Tejun Heo <tj@kernel.org>

Hi all,

Recent linux-next builds have been failing the above config with:

drivers/ata/libahci.c: In function 'ahci_host_activate_multi_irqs':
drivers/ata/libahci.c:2492:4: error: invalid use of undefined type
'struct msix_entry'
drivers/ata/libahci.c:2492:21: error: dereferencing pointer to incomplete type
make[1]: *** [drivers/ata/libahci.o] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/12556138/

A mindless bisect returns the following:

d684a90d38e24dcaf95fdb32c83efe05f80d152a is the first bad commit
commit d684a90d38e24dcaf95fdb32c83efe05f80d152a
Author: Dan Williams <dan.j.williamps@intel.com>
Date:   Wed Nov 11 16:27:33 2015 -0800

    ahci: per-port msix support

Alao note that the author field has been corrupted with a stray "p".

Paul,
