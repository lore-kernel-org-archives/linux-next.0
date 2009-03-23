From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Mon, 23 Mar 2009 11:06:29 +1100
Message-ID: <20090323110629.664e18d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55197 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751972AbZCWAGe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 20:06:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Daniel Silverstone <dsilvers@simtec.co.uk>

Hi Russell,

Today's linux-next merge of the arm tree got conflictS in
arch/arm/include/asm/elf.h and arch/arm/kernel/module.c between commit
4731f8b66dd34ebf0e67ca6ba9162b0e509bec06 ("[ARM] 5428/1: Module
relocation update for R_ARM_V4BX") from the arm-current tree and commit
2e1926e7b5d39eb31880152d636e8d8d011888cb ("[ARM] 5384/1: unwind: Add
stack unwinding support for loadable modules") from the arm tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/include/asm/elf.h
index ce3b36e,def8eac..0000000
--- a/arch/arm/include/asm/elf.h
+++ b/arch/arm/include/asm/elf.h
@@@ -50,7 -50,7 +50,8 @@@ typedef struct user_fp elf_fpregset_t
  #define R_ARM_ABS32	2
  #define R_ARM_CALL	28
  #define R_ARM_JUMP24	29
 +#define R_ARM_V4BX	40
+ #define R_ARM_PREL31	42
  
  /*
   * These are used to set parameters in the core dumps.
diff --cc arch/arm/kernel/module.c
index 9f509fd,13dbd5b..0000000
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@@ -132,15 -155,11 +155,20 @@@ apply_relocate(Elf32_Shdr *sechdrs, con
  			*(u32 *)loc |= offset & 0x00ffffff;
  			break;
  
 +	       case R_ARM_V4BX:
 +		       /* Preserve Rm and the condition code. Alter
 +			* other bits to re-code instruction as
 +			* MOV PC,Rm.
 +			*/
 +		       *(u32 *)loc &= 0xf000000f;
 +		       *(u32 *)loc |= 0x01a0f000;
 +		       break;
 +
+ 		case R_ARM_PREL31:
+ 			offset = *(u32 *)loc + sym->st_value - loc;
+ 			*(u32 *)loc = offset & 0x7fffffff;
+ 			break;
+ 
  		default:
  			printk(KERN_ERR "%s: unknown relocation: %u\n",
  			       module->name, ELF32_R_TYPE(rel->r_info));
