From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the asm-generic tree with Linus' tree
Date: Thu, 10 Nov 2016 09:38:45 +1100
Message-ID: <20161110093845.6f188af7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Chunyan Zhang <zhang.chunyan@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

Today's linux-next merge of the asm-generic tree got a conflict in:

  include/asm-generic/percpu.h

between commit:

  7f8d61f00522 ("percpu: use notrace variant of preempt_disable/preempt_enable")

from Linus' tree and commit:

  acbdf0e98066 ("percpu: make this_cpu_generic_read notrace")

from the asm-generic tree.

I fixed it up (these commits do exactly the same thing ... so I just
used the version from Linus' tree (since there is another patch there
that affects this part of the code)) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
