From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pstore tree
Date: Wed, 16 Nov 2016 11:27:49 +1100
Message-ID: <20161116112749.061f7424@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751950AbcKPA1w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Nov 2016 19:27:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joel Fernandes <joelaf@google.com>

Hi Kees,

After merging the pstore tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/rcupdate.h:38:0,
                 from include/linux/idr.h:18,
                 from include/linux/kernfs.h:14,
                 from include/linux/sysfs.h:15,
                 from include/linux/kobject.h:21,
                 from include/linux/device.h:17,
                 from fs/pstore/ram_core.c:17:
fs/pstore/ram_core.c: In function 'buffer_size_add':
include/linux/spinlock.h:246:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
   ^
fs/pstore/ram_core.c:78:16: note: 'flags' was declared here
  unsigned long flags;
                ^
In file included from include/linux/rcupdate.h:38:0,
                 from include/linux/idr.h:18,
                 from include/linux/kernfs.h:14,
                 from include/linux/sysfs.h:15,
                 from include/linux/kobject.h:21,
                 from include/linux/device.h:17,
                 from fs/pstore/ram_core.c:17:
fs/pstore/ram_core.c: In function 'buffer_start_add':
include/linux/spinlock.h:246:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
   ^
fs/pstore/ram_core.c:56:16: note: 'flags' was declared here
  unsigned long flags;
                ^

Introduced by commit

  95937ddce59a ("pstore: Allow prz to control need for locking")

They appear to be a very noisy false positives. :-(

-- 
Cheers,
Stephen Rothwell
