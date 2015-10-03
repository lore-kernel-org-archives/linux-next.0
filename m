From: Vinson Lee <vlee@twopensource.com>
Subject: =?UTF-8?B?bmV4dC0yMDE1MTAwMiBidWlsZCBlcnJvciAic2FtcGxlcy9rZGJ1cy9rZGJ1cy13b3JrZQ==?=
	=?UTF-8?B?cnMuYzo3Nzg6IGVycm9yOiDigJhDTE9DS19NT05PVE9OSUNfQ09BUlNF4oCZIg==?=
Date: Fri, 2 Oct 2015 19:10:38 -0700
Message-ID: <CAHTgTXXam2MA440R4hf+jZVaUYqtWERogPHHcosRv+kC2MUTEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33545 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbbJCCKk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2015 22:10:40 -0400
Received: by lafb9 with SMTP id b9so13062703laf.0
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2015 19:10:38 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>

Hi.

I am hitting this build error in kdbus-workers.c with Ubuntu 10.04.4.
Ubuntu 10.04.4 has glibc 2.11.

  HOSTCC  samples/kdbus/kdbus-workers
samples/kdbus/kdbus-workers.c: In function =E2=80=98child_run=E2=80=99:
samples/kdbus/kdbus-workers.c:778: error: =E2=80=98CLOCK_MONOTONIC_COAR=
SE=E2=80=99
undeclared (first use in this function)
samples/kdbus/kdbus-workers.c:778: error: (Each undeclared identifier
is reported only once
samples/kdbus/kdbus-workers.c:778: error: for each function it appears =
in.)
samples/kdbus/kdbus-workers.c: In function =E2=80=98bus_open_connection=
=E2=80=99:
samples/kdbus/kdbus-workers.c:1043: error: =E2=80=98O_CLOEXEC=E2=80=99 =
undeclared
(first use in this function)
samples/kdbus/kdbus-workers.c: In function =E2=80=98bus_make=E2=80=99:
samples/kdbus/kdbus-workers.c:1280: error: =E2=80=98O_CLOEXEC=E2=80=99 =
undeclared
(first use in this function)
make[2]: *** [samples/kdbus/kdbus-workers] Error 1

Cheers,
Vinson
