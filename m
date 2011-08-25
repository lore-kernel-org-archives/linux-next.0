From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [Patch] numa: introduce CONFIG_NUMA_SYSFS for
 drivers/base/node.c
Date: Wed, 24 Aug 2011 20:50:44 -0700
Message-ID: <20110824205044.7ff45b6c.rdunlap@xenotime.net>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au>
	<20110804152211.ea10e3e7.rdunlap@xenotime.net>
	<20110823143912.0691d442.akpm@linux-foundation.org>
	<4E547155.8090709@redhat.com>
	<20110824191430.8a908e70.rdunlap@xenotime.net>
	<4E55C221.8080100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:38469 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750952Ab1HYDuq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Aug 2011 23:50:46 -0400
In-Reply-To: <4E55C221.8080100@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org

On Thu, 25 Aug 2011 11:31:45 +0800 Cong Wang wrote:

> =E4=BA=8E 2011=E5=B9=B408=E6=9C=8825=E6=97=A5 10:14, Randy Dunlap =E5=
=86=99=E9=81=93:
> > On Wed, 24 Aug 2011 11:34:45 +0800 Cong Wang wrote:
> >
> >> Hi, Andrew,
> >>
> >> Do you think my patch below is better?
> >
> > Hi,
> >
> > This causes build errors for me because node.o is not being built:
> >
> > arch/x86/built-in.o: In function `topology_init':
> > topology.c:(.init.text+0x3668): undefined reference to `register_on=
e_node'
> > drivers/built-in.o: In function `unregister_cpu':
> > (.text+0x7aecc): undefined reference to `unregister_cpu_under_node'
> > drivers/built-in.o: In function `register_cpu':
> > (.cpuinit.text+0xc1): undefined reference to `register_cpu_under_no=
de'
>=20
> Ah, this is because I missed the part in include/linux/node.h. :)
>=20
> Below is the updated version.
>=20
> Thanks for testing!

Yes, that works after changing #ifdef defined(...)
to #if defined(...)

Acked-by: Randy Dunlap <rdunlap@xenotime.net>


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
