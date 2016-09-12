From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Mon, 12 Sep 2016 11:32:24 +1000
Message-ID: <20160912113224.792b24f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Michal,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/Kconfig

between commit:

  0f60a8efe400 ("mm: Implement stack frame object validation")

from Linus' tree and commits:

  a5967db9af51 ("kbuild: allow architectures to use thin archives instead of ld -r")
  b67067f1176d ("kbuild: allow archs to select link dead code/data elimination")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/Kconfig
index fd6e9712af81,3f948c422d9d..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -450,15 -461,25 +450,34 @@@ config CC_STACKPROTECTOR_STRON
  
  endchoice
  
 +config HAVE_ARCH_WITHIN_STACK_FRAMES
 +	bool
 +	help
 +	  An architecture should select this if it can walk the kernel stack
 +	  frames to determine if an object is part of either the arguments
 +	  or local variables (i.e. that it excludes saved return addresses,
 +	  and similar) by implementing an inline arch_within_stack_frames(),
 +	  which is used by CONFIG_HARDENED_USERCOPY.
 +
+ config THIN_ARCHIVES
+ 	bool
+ 	help
+ 	  Select this if the architecture wants to use thin archives
+ 	  instead of ld -r to create the built-in.o files.
+ 
+ config LD_DEAD_CODE_DATA_ELIMINATION
+ 	bool
+ 	help
+ 	  Select this if the architecture wants to do dead code and
+ 	  data elimination with the linker by compiling with
+ 	  -ffunction-sections -fdata-sections and linking with
+ 	  --gc-sections.
+ 
+ 	  This requires that the arch annotates or otherwise protects
+ 	  its external entry points from being discarded. Linker scripts
+ 	  must also merge .text.*, .data.*, and .bss.* correctly into
+ 	  output sections.
+ 
  config HAVE_CONTEXT_TRACKING
  	bool
  	help
