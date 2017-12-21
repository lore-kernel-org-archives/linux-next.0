From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with the printk tree
Date: Fri, 22 Dec 2017 10:45:30 +1100
Message-ID: <20171222104530.70bef8ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49015 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752148AbdLUXpc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 18:45:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, "Tobin C. Harding" <me@tobin.cc>

Hi Jonathan,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/core-api/printk-formats.rst

between commit:

  d7c6075efa6c ("symbol lookup: introduce dereference_symbol_descriptor()")

from the printk tree and commit:

  b3ed23213eab ("doc: convert printk-formats.txt to rst")

from the jc_docs tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/core-api/printk-formats.rst
index dc3551ef1a4b,258b46435320..000000000000
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@@ -61,33 -68,44 +68,33 @@@ Symbols/Function Pointer
  
  ::
  
 +	%pS	versatile_init+0x0/0x110
 +	%ps	versatile_init
  	%pF	versatile_init+0x0/0x110
  	%pf	versatile_init
 -	%pS	versatile_init+0x0/0x110
  	%pSR	versatile_init+0x9/0x110
  		(with __builtin_extract_return_addr() translation)
 -	%ps	versatile_init
  	%pB	prev_fn_of_versatile_init+0x88/0x88
  
 +The ``S`` and ``s`` specifiers are used for printing a pointer in symbolic
- format. They result in the symbol name with (``S``) or without (``s``)
++format. They result in the symbol name with (S) or without (s)
 +offsets. If KALLSYMS are disabled then the symbol address is printed instead.
  
- Note, that the ``F`` and ``f`` specifiers are identical to ``S`` (``s``)
 -The ``F`` and ``f`` specifiers are for printing function pointers,
 -for example, f->func, &gettimeofday. They have the same result as
 -``S`` and ``s`` specifiers. But they do an extra conversion on
 -ia64, ppc64 and parisc64 architectures where the function pointers
 -are actually function descriptors.
 -
 -The ``S`` and ``s`` specifiers can be used for printing symbols
 -from direct addresses, for example, __builtin_return_address(0),
 -(void *)regs->ip. They result in the symbol name with (S) or
 -without (s) offsets. If KALLSYMS are disabled then the symbol
 -address is printed instead.
++Note, that the ``F`` and ``f`` specifiers are identical to ``S`` (s)
 +and thus deprecated. We have ``F`` and ``f`` because on ia64, ppc64 and
 +parisc64 function pointers are indirect and, in fact, are function
 +descriptors, which require additional dereferencing before we can lookup
 +the symbol. As of now, ``S`` and ``s`` perform dereferencing on those
 +platforms (when needed), so ``F`` and ``f`` exist for compatibility
 +reasons only.
  
  The ``B`` specifier results in the symbol name with offsets and should be
  used when printing stack backtraces. The specifier takes into
  consideration the effect of compiler optimisations which may occur
- when tail-call``s are used and marked with the noreturn GCC attribute.
+ when tail-calls are used and marked with the noreturn GCC attribute.
  
 -Examples::
 -
 -	printk("Going to call: %pF\n", gettimeofday);
 -	printk("Going to call: %pF\n", p->func);
 -	printk("%s: called from %pS\n", __func__, (void *)_RET_IP_);
 -	printk("%s: called from %pS\n", __func__,
 -				(void *)__builtin_return_address(0));
 -	printk("Faulted at %pS\n", (void *)regs->ip);
 -	printk(" %s%pB\n", (reliable ? "" : "? "), (void *)*stack);
 -
  Kernel Pointers
- ===============
+ ---------------
  
  ::
  
