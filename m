From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Mar 20 (vmcore)
Date: Wed, 20 Mar 2013 11:56:01 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1303201153330.17761@chino.kir.corp.google.com>
References: <20130320160536.54e62fc11a3651494b710e3b@canb.auug.org.au> <5149E813.8060307@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:57900 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757229Ab3CTS4E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 14:56:04 -0400
Received: by mail-da0-f47.google.com with SMTP id s35so1152366dak.34
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 11:56:03 -0700 (PDT)
In-Reply-To: <5149E813.8060307@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, HATAYAMA Daisuke <d.hatayama@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org

On Wed, 20 Mar 2013, Randy Dunlap wrote:

> on x86_64:
> 
> fs/proc/vmcore.c: In function 'merge_note_headers_elf64':
> fs/proc/vmcore.c:349:22: error: 'VMCOREINFO_NOTE_NAME' undeclared (first use in this function)
> fs/proc/vmcore.c:349:22: note: each undeclared identifier is reported only once for each function it appears in
> fs/proc/vmcore.c: In function 'merge_note_headers_elf32':
> fs/proc/vmcore.c:470:22: error: 'VMCOREINFO_NOTE_NAME' undeclared (first use in this function)
> make[3]: *** [fs/proc/vmcore.o] Error 1
> 
> 
> Needs to #include <linux/kexec.h>
> 

I don't think that's it, linux/kexec.h already gets included indirectly.  
The problem is that CONFIG_KEXEC isn't set so the definition in kexec.h is 
meaningless.

This comes from "vmcore: check NT_VMCORE_PAD as a mark indicating the end 
of ELF note buffer" merged through the -mm tree.  I've added the patch's 
author and Andrew to the cc.

How can this be protected by CONFIG_KEXEC?
