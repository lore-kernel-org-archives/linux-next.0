From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Wed, 29 Jul 2015 12:19:12 -0400
Message-ID: <20150729161912.GF18685@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:58832 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751206AbbG2QTZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 12:19:25 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dh.herrmann@googlemail.com
Cc: gregkh@linuxfoundation.org, daniel@zonque.org, tixxdz@opendz.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Hi David,

Does it make sense to build this sample when cross compiling?

The reason I ask is that it has been breaking the linux-next build of
allmodconfig for a while now, with:

  HOSTCC  samples/kdbus/kdbus-workers
samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99:
samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_create=
=E2=80=99 undeclared (first use in this function)
  p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
                  ^
samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifier =
is reported only once for each function it appears in
scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-worker=
s' failed
make[2]: *** [samples/kdbus/kdbus-workers] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/12473453/

We recently made some changes to skip other sample/test programs when
cross compiling in mainline 65f6f092a6987 and f59514b6a8c5ca6dd and
6a407a81a9abcf.  Maybe it makes sense to do the same here?

Paul.
