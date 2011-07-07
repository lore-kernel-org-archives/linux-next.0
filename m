From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Today's Linux Next failed to even start building, I must have done
 something wrong
Date: Thu, 07 Jul 2011 14:47:20 +0200
Message-ID: <4E15AAD8.6080005@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]:57851 "EHLO
	mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755742Ab1GGNYd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 09:24:33 -0400
Received: from mail405.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id CEF9D1010F63
	for <linux-next@vger.kernel.org>; Thu,  7 Jul 2011 14:47:42 +0200 (CEST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

Hello,

I'm not sure - which base source tree should I take to apply the patch?=
=20
I fail for now with building witch Debian make-kpkg with messages:

# ...
make    ARCH=3Dx86_64 prepare
make[2]: Wej=C5=9Bcie do katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
scripts/kconfig/conf --silentoldconfig Kconfig
make[2]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
make[2]: Wej=C5=9Bcie do katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
   CHK     include/linux/version.h
   UPD     include/linux/version.h
   CHK     include/generated/utsrelease.h
   UPD     include/generated/utsrelease.h
   CC      kernel/bounds.s
   GEN     include/generated/bounds.h
   CC      arch/x86/kernel/asm-offsets.s
In file included from include/linux/sched.h:64:0,
                  from arch/x86/kernel/asm-offsets.c:9:
include/linux/mm_types.h:74:15: error: duplicate member =E2=80=98_count=
=E2=80=99
make[3]: *** [arch/x86/kernel/asm-offsets.s] B=C5=82=C4=85d 1
make[2]: *** [prepare0] B=C5=82=C4=85d 2
make[2]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
make[1]: *** [debian/stamp/conf/kernel-conf] B=C5=82=C4=85d 2
make[1]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
make: *** [debian/stamp/conf/minimal_debian] B=C5=82=C4=85d 2
=46ailed to create a ./debian directory: Nie ma takiego pliku ani katal=
ogu=20
at /usr/bin/make-kpkg line 984.

Please help me.

--=20
=46amiliada:
- Zwierze w paski?
- Biedronka!
NP: Nemo -
NB: 3.0.0-rc6
