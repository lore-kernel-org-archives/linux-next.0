From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with the kbuild tree
Date: Fri, 31 Mar 2017 10:54:30 +1100
Message-ID: <20170331105430.70ec4a70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33775 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934058AbdC3Xyd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Mar 2017 19:54:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/include/uapi/asm/Kbuild

between commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree and commit:

  c30abecb39d1 ("s390/uapi: use generic headers if possible")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/uapi/asm/Kbuild
index b15bf6bc0e94,addb09cee0f5..000000000000
--- a/arch/s390/include/uapi/asm/Kbuild
+++ b/arch/s390/include/uapi/asm/Kbuild
@@@ -1,2 -1,58 +1,12 @@@
  # UAPI Header export list
  include include/uapi/asm-generic/Kbuild.asm
+ 
+ generic-y += errno.h
+ generic-y += fcntl.h
+ generic-y += ioctl.h
+ generic-y += mman.h
+ generic-y += param.h
+ generic-y += poll.h
+ generic-y += resource.h
+ generic-y += sockios.h
+ generic-y += termbits.h
 -
 -header-y += auxvec.h
 -header-y += bitsperlong.h
 -header-y += byteorder.h
 -header-y += chpid.h
 -header-y += chsc.h
 -header-y += clp.h
 -header-y += cmb.h
 -header-y += dasd.h
 -header-y += debug.h
 -header-y += errno.h
 -header-y += guarded_storage.h
 -header-y += hypfs.h
 -header-y += ioctls.h
 -header-y += ipcbuf.h
 -header-y += kvm.h
 -header-y += kvm_para.h
 -header-y += kvm_perf.h
 -header-y += kvm_virtio.h
 -header-y += monwriter.h
 -header-y += msgbuf.h
 -header-y += pkey.h
 -header-y += posix_types.h
 -header-y += ptrace.h
 -header-y += qeth.h
 -header-y += schid.h
 -header-y += sclp_ctl.h
 -header-y += sembuf.h
 -header-y += setup.h
 -header-y += shmbuf.h
 -header-y += sie.h
 -header-y += sigcontext.h
 -header-y += siginfo.h
 -header-y += signal.h
 -header-y += socket.h
 -header-y += stat.h
 -header-y += statfs.h
 -header-y += swab.h
 -header-y += tape390.h
 -header-y += termios.h
 -header-y += types.h
 -header-y += ucontext.h
 -header-y += unistd.h
 -header-y += virtio-ccw.h
 -header-y += vtoc.h
 -header-y += zcrypt.h
