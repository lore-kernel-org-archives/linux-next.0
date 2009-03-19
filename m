From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next March 19: drivers/comedi build break.
Date: Thu, 19 Mar 2009 18:50:10 +0530
Message-ID: <49C2468A.1040504@in.ibm.com>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:39060 "EHLO
	e23smtp01.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753856AbZCSNUQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 09:20:16 -0400
In-Reply-To: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Next 19 randconfig build fails with :

  CC [M]  drivers/staging/comedi/comedi_fops.o
In file included from drivers/staging/comedi/comedidev.h:38,
                 from drivers/staging/comedi/comedi_fops.c:45:
drivers/staging/comedi/interrupt.h:25: error: conflicting types for =91=
irqreturn_t=92
include/linux/irqreturn.h:14: error: previous declaration of =91irqretu=
rn_t=92 was here
In file included from drivers/staging/comedi/comedidev.h:38,
                 from drivers/staging/comedi/comedi_fops.c:45:
drivers/staging/comedi/interrupt.h:28:1: warning: "IRQ_RETVAL" redefine=
d
In file included from include/linux/interrupt.h:10,
                 from drivers/staging/comedi/interrupt.h:22,
                 from drivers/staging/comedi/comedidev.h:38,
                 from drivers/staging/comedi/comedi_fops.c:45:
include/linux/irqreturn.h:15:1: warning: this is the location of the pr=
evious definition
make[3]: *** [drivers/staging/comedi/comedi_fops.o] Error 1

Probably because of the irqreturn_t related changes.

Thanks
-Sachin

--=20

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
