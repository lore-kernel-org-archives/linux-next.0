From: Gabriel C <nix.or.die@googlemail.com>
Subject: Re: linux-next: UML build error
Date: Wed, 21 May 2008 22:20:39 +0200
Message-ID: <48348417.9090103@googlemail.com>
References: <48345B31.50904@googlemail.com> <20080521200515.GB12373@c2.user-mode-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.188]:18710 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758518AbYEUUU5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 16:20:57 -0400
Received: by gv-out-0910.google.com with SMTP id e6so913380gvc.37
        for <linux-next@vger.kernel.org>; Wed, 21 May 2008 13:20:55 -0700 (PDT)
In-Reply-To: <20080521200515.GB12373@c2.user-mode-linux.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Dike <jdike@addtoit.com>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net

Jeff Dike wrote:

> On Wed, May 21, 2008 at 07:26:09PM +0200, Gabriel C wrote:
>>   CC      arch/um/sys-x86_64/ksyms.o
>> arch/um/sys-x86_64/ksyms.c:5: error: '__memcpy' undeclared here (not in a function)
>> arch/um/sys-x86_64/ksyms.c:5: warning: type defaults to 'int' in declaration of '__memcpy'
> 
> Does the patch below help?  There's gcc-version-dependent logic in
> include/asm-x86/string_64.h which decides whether to declare memcpy or
> __memcpy and it looks like you're hitting that.


Yes is fixes this error , however I get now another one but this one seems to be an compiler bug.

...
 CC      arch/um/sys-x86_64/um_module.o
  LD      arch/um/sys-x86_64/subarch.o
  LD      arch/um/sys-x86_64/built-in.o
  LD      arch/x86/crypto/built-in.o
  CC      kernel/sched.o
In file included from kernel/sched.c:1842:
kernel/sched_idletask.c: In function 'check_preempt_curr_idle':
kernel/sched_idletask.c:20: internal compiler error: in cgraph_estimate_size_after_inlining, at ipa-inline.c:188

...

This is gcc 4.3.0 ( with backports of some known fixed bugs ).
I try to build latest snapshot of gcc 4.3* later on today and try with this one. 

> 
> 	     	      Jeff
> 



Gabriel
