From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Sat, 27 Jul 2013 01:54:44 +0300
Message-ID: <51F2FE34.8010601@gmail.com>
References: <20130726160254.83bbe994219d6ee732c64b7d@canb.auug.org.au>
 <20130726210335.GA2788@kroah.com> <51F2E8A4.2010405@gmail.com>
 <20130726215634.GA31820@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mxout1.netvision.net.il ([194.90.9.20]:48099 "EHLO
	mxout1.netvision.net.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756108Ab3GZWz0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Jul 2013 18:55:26 -0400
In-reply-to: <20130726215634.GA31820@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/07/13 00:56, Greg KH wrote:
> No, I need you to do that.  Can you do a kernel build with:
> 	make M=drivers/staging/xillybus C=1
> and fix up the errors that sparse reports and send a patch for that?
>
>    
I'm not sure it's related to me. I get the same errors whether I compile 
my own modules or something in e.g. drivers/tty/ . This is what I get 
after make allmodconfig on the current staging git repo:

$ make M=drivers/staging/xillybus C=1
/home/eli/xillybus/submission/staging/arch/x86/Makefile:107: 
CONFIG_X86_X32 enabled but no binutils support
   CHECK   drivers/staging/xillybus/xillybus_core.c
/home/eli/xillybus/submission/staging/arch/x86/include/asm/jump_label.h:16:13: 
error: Expected ( after asm
/home/eli/xillybus/submission/staging/arch/x86/include/asm/jump_label.h:16:13: 
error: got goto
   CC [M]  drivers/staging/xillybus/xillybus_core.o
   CHECK   drivers/staging/xillybus/xillybus_pcie.c
/home/eli/xillybus/submission/staging/arch/x86/include/asm/jump_label.h:16:13: 
error: Expected ( after asm
/home/eli/xillybus/submission/staging/arch/x86/include/asm/jump_label.h:16:13: 
error: got goto
   CC [M]  drivers/staging/xillybus/xillybus_pcie.o

I'll spare you the output from modules in drivers/tty. But it's exactly 
the same messages on each of these modules.

Am I doing something wrong?

Regards,
    Eli

P.S. Regarding the missing Reported-By header, I learned something new 
today. Thanks. :)
