From: Richard Weinberger <richard@nod.at>
Subject: linux-next: user mode linux build failure (2)
Date: Tue, 19 Oct 2010 02:00:01 +0200
Message-ID: <201010190200.01496.richard@nod.at>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:54689 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933468Ab0JSAAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 20:00:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: arnd@arndb.de
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi!

1e3d8715 (uml: kill big kernel lock) breaks um build.

arch/um/drivers/ubd_kern.c: In function 'ubd_open':
arch/um/drivers/ubd_kern.c:1104: error: 'ubd_mutex' undeclared (first use in 
this function)
arch/um/drivers/ubd_kern.c:1104: error: (Each undeclared identifier is 
reported only once
arch/um/drivers/ubd_kern.c:1104: error: for each function it appears in.)
arch/um/drivers/ubd_kern.c: In function 'ubd_release':
arch/um/drivers/ubd_kern.c:1131: error: 'ubd_mutex' undeclared (first use in 
this function)
make[1]: *** [arch/um/drivers/ubd_kern.o] Error 1
make: *** [arch/um/drivers] Error 2

It seems you forgot to define ubd_mutex in ubd_kern.c.

Thanks,
//richard
