From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next-20151002 build =?utf-8?Q?error_?=
 =?utf-8?Q?=22samples=2Fkdbus=2Fkdbus-workers=2Ec=3A778=3A_error=3A_?=
 =?utf-8?B?4oCYQ0xPQ0tfTU9OT1RPTklDX0NPQVJTReKAmSI=?=
Date: Sat, 3 Oct 2015 13:21:01 +0200
Message-ID: <20151003112101.GD22260@kroah.com>
References: <CAHTgTXXam2MA440R4hf+jZVaUYqtWERogPHHcosRv+kC2MUTEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:40209 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbJCLVG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 3 Oct 2015 07:21:06 -0400
Content-Disposition: inline
In-Reply-To: <CAHTgTXXam2MA440R4hf+jZVaUYqtWERogPHHcosRv+kC2MUTEQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@twopensource.com>
Cc: linux-next@vger.kernel.org, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

On Fri, Oct 02, 2015 at 07:10:38PM -0700, Vinson Lee wrote:
> Hi.
>=20
> I am hitting this build error in kdbus-workers.c with Ubuntu 10.04.4.
> Ubuntu 10.04.4 has glibc 2.11.

Ugh, that's an old glibc :(

>   HOSTCC  samples/kdbus/kdbus-workers
> samples/kdbus/kdbus-workers.c: In function =E2=80=98child_run=E2=80=99=
:
> samples/kdbus/kdbus-workers.c:778: error: =E2=80=98CLOCK_MONOTONIC_CO=
ARSE=E2=80=99
> undeclared (first use in this function)
> samples/kdbus/kdbus-workers.c:778: error: (Each undeclared identifier
> is reported only once
> samples/kdbus/kdbus-workers.c:778: error: for each function it appear=
s in.)
> samples/kdbus/kdbus-workers.c: In function =E2=80=98bus_open_connecti=
on=E2=80=99:
> samples/kdbus/kdbus-workers.c:1043: error: =E2=80=98O_CLOEXEC=E2=80=99=
 undeclared
> (first use in this function)
> samples/kdbus/kdbus-workers.c: In function =E2=80=98bus_make=E2=80=99=
:
> samples/kdbus/kdbus-workers.c:1280: error: =E2=80=98O_CLOEXEC=E2=80=99=
 undeclared
> (first use in this function)
> make[2]: *** [samples/kdbus/kdbus-workers] Error 1

As I don't have access to such ancient machines, could you work on a
patch for this, adding the needed defines if they aren't present by the
libc?

thanks,

greg k-h
