From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: randconfig build error with next-20150421, in net/ceph
Date: Tue, 21 Apr 2015 09:16:13 -0700
Message-ID: <20150421161613.GA29133@roeck-us.net>
References: <CA+r1Zhgwq-t+M8XOxDqf5synesyHODOee2gNwAJpWE+wwmAAoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51614 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756041AbbDUQQU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2015 12:16:20 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1YkaqR-002ls9-94
	for linux-next@vger.kernel.org; Tue, 21 Apr 2015 16:16:19 +0000
Content-Disposition: inline
In-Reply-To: <CA+r1Zhgwq-t+M8XOxDqf5synesyHODOee2gNwAJpWE+wwmAAoQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, zyan@redhat.com, sage@redhat.com, "David S. Miller" <davem@davemloft.net>, ceph-devel@vger.kernel.org, netdev <netdev@vger.kernel.org>

On Tue, Apr 21, 2015 at 08:10:44AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> ERROR: "__divdi3" [net/ceph/libceph.ko] undefined!

Commit 7321f19d ("crush: straw2 bucket type with an efficient 64-bit crush_ln()").

+                       draw = ln / w;

where 'ln' is 64 bit.

Some other oddies in that patch, such as 

+#if defined(__linux__)
+#include <linux/types.h>
+#elif defined(__FreeBSD__)
+#include <sys/types.h>
+#endif

and lots of coding style violations.

Guenter
