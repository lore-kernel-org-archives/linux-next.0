From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: Next April 7 : x86 allmodconfig failure [kernel/module.c]
Date: Tue, 07 Apr 2009 16:53:31 +0530
Message-ID: <1239103411.5300.26.camel@subratamodak.linux.ibm.com>
References: <1239103297.5300.24.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:43519 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244AbZDGLXe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 07:23:34 -0400
In-Reply-To: <1239103297.5300.24.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, rusty <rusty@rustcorp.com.au>, rusty <rusty@au1.ibm.com>

Sorry,

This occurred on April 7th Tree.

On Tue, 2009-04-07 at 16:51 +0530, Subrata Modak wrote:
> Hi,
>=20
> Following build failure occurs with April 7 next tree on x86, kernel
> configuration enabled as randconfig.
>=20
> kernel/module.c: In function =E2=80=98sys_init_module=E2=80=99:
> kernel/module.c:2401: error: =E2=80=98modules_disabled=E2=80=99 undec=
lared (first use in
> this function)
> kernel/module.c:2401: error: (Each undeclared identifier is reported
> only once
> kernel/module.c:2401: error: for each function it appears in.)
> make[1]: *** [kernel/module.o] Error 1
> make: *** [kernel] Error 2
>=20
> Regards--
> Subrata
>=20

Regards--
Subrata
