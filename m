From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Sun, 03 Aug 2008 21:26:20 -0700 (PDT)
Message-ID: <20080803.212620.17129972.davem@davemloft.net>
References: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50988
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751092AbYHDE0U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 00:26:20 -0400
In-Reply-To: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 25 Jul 2008 17:05:27 +1000

> Hi Dave,
> 
> Today's linux-next build (sparc defconfig) failed like this:
> 
>   Building modules, stage 2.
> .tmp_kallsyms2.o(.rodata+0x0): In function `kallsyms_addresses':
> : relocation truncated to fit: R_SPARC_32 _text

FWIW, Sam had narrowed it down to:

commit fd593d12770d4a0d1ff095d44b96436c18479ee8
Author: Eric W. Biederman <ebiederm@xmission.com>
Date:   Thu Dec 7 02:14:04 2006 +0100

    [PATCH] relocatable kernel: Kallsyms generate relocatable symbols
    
    Print the addresses of non-absolute symbols relative to _text
    so that ld will generate relocations.  Allowing a relocatable
    kernel to relocate them.  We can't actually use the symbol names
    because kallsyms includes static symbols that are not exported
    from their object files.
    
    Add the _text symbol definitions to the architectures which don't
    define it otherwise linker will fail.
    
    Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
    Signed-off-by: Vivek Goyal <vgoyal@in.ibm.com>
    Signed-off-by: Andi Kleen <ak@suse.de>

and

commit 2c22d8baa98a92022acb85b0b7c6f4a60df55f47
Author: Vivek Goyal <vgoyal@in.ibm.com>
Date:   Thu Dec 7 02:14:10 2006 +0100

    [PATCH] relocatable kernel: Fix kallsyms on avr32 after relocatable kernel changes
    
    o On some platforms like avr32, section init comes before .text and
      not necessarily a symbol's relative position w.r.t _text is positive.
      In such cases assembler detects the overflow and emits warning. This
      patch fixes it.
    
    Signed-off-by: Vivek Goyal <vgoyal@in.ibm.com>
    Signed-off-by: Andi Kleen <ak@suse.de>
    Cc: Andi Kleen <ak@suse.de>
    Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>
    Signed-off-by: Andrew Morton <akpm@osdl.org>

but I personally still can't reproduce this.  I even had the gcc-3.4.5
that's installed on my box, using defconfig just like you, and I can't
trigger this problem.
