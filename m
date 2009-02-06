From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH] revert headers_check fix: ia64, fpu.h
Date: Fri, 6 Feb 2009 10:53:54 -0800
Message-ID: <57C9024A16AD2D4C97DC78E552063EA36121A48B@orsmsx505.amr.corp.intel.com>
References: <1233385816.17794.16.camel@localhost.localdomain>
	 <20090206164546.6291.KOSAKI.MOTOHIRO@jp.fujitsu.com>
 <3f9a31f40902060053x18dacf58u40c739ab89f13860@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:56714 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751309AbZBFSyA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2009 13:54:00 -0500
In-Reply-To: <3f9a31f40902060053x18dacf58u40c739ab89f13860@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaswinder Singh Rajput <jaswinderlinux@gmail.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "hskinnemoen@atmel.com" <hskinnemoen@atmel.com>, "cooloney@kernel.org" <cooloney@kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "dhowells@redhat.com" <dhowells@redhat.com>, "matthew@wil.cx" <matthew@wil.cx>, "chris@zankel.net" <chris@zankel.net>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>

> > -#include <linux/types.h>
> > +#include <asm/types.h>
> >
>
> No , we do not even need asm/types.h

...

> -#include <linux/types.h>
> -

This works.

Acked-by: Tony Luck <tony.luck@intel.com>
