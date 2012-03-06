From: Mark Salter <msalter@redhat.com>
Subject: lib/string.h build failure in linux-next
Date: Tue, 06 Mar 2012 10:42:18 -0500
Message-ID: <1331048540.17099.9.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
Sender: linux-arch-owner@vger.kernel.org
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

I'm seeing a build failure in lib/string.h in linux-next:

/es/linux/linux-next/lib/string.c: In function 'strlcat':
/es/linux/linux-next/lib/string.c:225:2: error: implicit declaration of function 'printk'
/es/linux/linux-next/lib/string.c:225:2: error: implicit declaration of function 'panic'

Commit e2950c2b6ecb928bfd3a13dd237df1f29f712704 removed an include of
linux/module.h which triggered the problem for arch/c6x and probably
other architectures using the asm-generic BUG macro.

I think this needs fixing in asm-generic/bug.h which should include
linux/kernel.h for panic and linux/printk.h for printk.

--Mark
