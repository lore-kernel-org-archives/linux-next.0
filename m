From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the printk tree
Date: Wed, 6 Dec 2017 14:23:00 +1100
Message-ID: <20171206142300.64d5a70f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Petr,

After merging the printk tree, today's linux-next build (x86_64
allnoconfig) failed like this:

lib/vsprintf.o: In function `pointer':
vsprintf.c:(.text+0x2260): undefined reference to `dereference_symbol_descriptor'

Caused by commit

  b77929215209 ("symbol lookup: introduce dereference_symbol_descriptor()")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
