From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] staging: dgnc: driver.c: Add missing #include
 <linux/slab.h>
Date: Fri, 23 Aug 2013 10:01:38 -0700
Message-ID: <20130823170137.GA31358@kroah.com>
References: <1377260629-1696-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58567 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052Ab3HWRBk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2013 13:01:40 -0400
Content-Disposition: inline
In-Reply-To: <1377260629-1696-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Fri, Aug 23, 2013 at 02:23:49PM +0200, Geert Uytterhoeven wrote:
> m68k/sparc64 allmodconfig:
>=20
> drivers/staging/dgnc/dgnc_driver.c: In function =E2=80=98dgnc_cleanup=
_board=E2=80=99:
> drivers/staging/dgnc/dgnc_driver.c:459: error: implicit declaration o=
f function =E2=80=98kfree=E2=80=99
> drivers/staging/dgnc/dgnc_driver.c: In function =E2=80=98dgnc_driver_=
kzmalloc=E2=80=99:
> drivers/staging/dgnc/dgnc_driver.c:905: error: implicit declaration o=
f function =E2=80=98kmalloc=E2=80=99
> drivers/staging/dgnc/dgnc_driver.c:905: warning: initialization makes=
 pointer from integer without a cast
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

This already went into my tree yesterday, so all should be good now.

thanks,

greg k-h
