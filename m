From: Guenter Roeck <linux@roeck-us.net>
Subject: Build failures in -next due to commit "asm-generic: {get,put}_user
 ptr argument evaluate only 1 time"
Date: Mon, 20 Jul 2015 12:56:21 -0700
Message-ID: <55AD5265.5070109@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48060 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754579AbbGTT40 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2015 15:56:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jens Axboe <axboe@kernel.dk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi,

Commit 52b2512d507d ("asm-generic: {get,put}_user ptr argument evaluate=
 only 1 time")
causes the following compile error with various architectures (arc, arc=
v2, c6x, hexagon,
um, unicore32) in -next.

block/scsi_ioctl.c: In function =E2=80=98sg_scsi_ioctl=E2=80=99:
block/scsi_ioctl.c:436:2: error: invalid initializer
   if (get_user(opcode, sic->data))
   ^
make[1]: *** [block/scsi_ioctl.o] Error 1

A possible fix would be to use &sic->data[0] instead, but I am not sure=
 if this change
in semantics of get_user would be acceptable.

Another failure due to the same commit is seen when building arc:axs103=
_defconfig.

fs/fat/dir.c: In function =E2=80=98fat_ioctl_filldir=E2=80=99:
fs/fat/dir.c:752:43: error: invalid initializer
  FAT_IOCTL_FILLDIR_FUNC(fat_ioctl_filldir, __fat_dirent)

This error is related to the put_user changes. No idea how to fix that =
one.

Guenter
