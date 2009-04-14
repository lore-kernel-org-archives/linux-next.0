From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: [BUILD FAILURE 01/04] Next April 14 : x86 randconfig
	[kernel/module.c]
Date: Tue, 14 Apr 2009 23:57:07 +0530
Message-ID: <1239733627.5344.69.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:38134 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210AbZDNS12 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 14:27:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Observed the following build error:
---
kernel/module.c: In function =E2=80=98sys_init_module=E2=80=99:
kernel/module.c:2398: error: =E2=80=98modules_disabled=E2=80=99 undecla=
red (first use in
this function)
kernel/module.c:2398: error: (Each undeclared identifier is reported
only once
kernel/module.c:2398: error: for each function it appears in.)
make[1]: *** [kernel/module.o] Error 1
make: *** [kernel] Error 2
---

Occurs also on x86_64 and PPC64. Fix is available:
http://patchwork.kernel.org/patch/16535/,

Probably till to make into this tree.

Regards--
Subrata
