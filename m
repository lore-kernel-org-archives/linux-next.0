From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the tip tree
Date: Thu, 2 Nov 2017 15:20:58 +1100
Message-ID: <20171102152058.4facb497@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750753AbdKBEVB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 00:21:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/lkdtm_core.c

between commit:

  8776fe75dc0e ("lkdtm, kprobes: Convert from jprobes to kprobes")

from the tip tree and commits:

  31c5c870a112 ("lkdtm: Convert from jprobe to kprobe")
  75f98b7ab748 ("lkdtm: Constify the crashtypes table")

from the char-misc tree.

[8776fe75dc0e and 31c5c870a112 are the same patch]

I fixed it up (I just usted the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
