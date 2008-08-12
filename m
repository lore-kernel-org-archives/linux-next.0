From: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Subject: Re: linux-next: Tree for August 11
Date: Tue, 12 Aug 2008 10:39:08 -0700
Message-ID: <48A1CABC.5010407@ct.jp.nec.com>
References: <20080811164617.7b06df12.sfr@canb.auug.org.au>	<48A09CE5.70402@ct.jp.nec.com> <20080812153851.179fc90d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gateway-1237.mvista.com ([63.81.120.158]:2816 "EHLO
	gateway-1237.mvista.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267AbYHLRjN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 13:39:13 -0400
In-Reply-To: <20080812153851.179fc90d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alan Cox <alan@redhat.com>, Jeff Dike <jdike@addtoit.com>

Stephen Rothwell wrote:
> Hi Hiroshi,
> 
> On Mon, 11 Aug 2008 13:11:17 -0700 Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com> wrote:
>> I got an error on um defconfig;
>>
>> arch/um/drivers/line.c: In function 'line_ioctl':
>> arch/um/drivers/line.c:306: error: implicit declaration of function 'tioclinux'
>> make[1]: *** [arch/um/drivers/line.o] Error 1
>>
>>
>> This commit may cause it.
>>
>> commit 1aa5f1fab397054a9133bcaf511973db5a6b97be
>> Author: Alan Cox <alan@redhat.com>
>> Date:   Mon Aug 11 10:27:35 2008 +1000
>>
>>     tty-fixup-uml
>>
>>     Add a new nicer hook for tioclinux
> 
> It looks like it may be fixed in today's linux-next as that patch has
> been updated.
> 

Hi, thanks for working.

I got a linkage error, next;

arch/um/drivers/built-in.o: In function `line_ioctl':
/data/kernel/mainline/workdir/next/.branches/um/linux/arch/um/drivers/line.c:306: undefined reference to `tioclinux'
collect2: ld returned 1 exit status
  KSYM    .tmp_kallsyms1.S
nm: '.tmp_vmlinux1': No such file
No valid symbol.
make: *** [.tmp_kallsyms1.S] Error 1

The tioclinux() is in drivers/char/vt.c and this is compiled when
CONFIG_HW_CONSOLE is enabled. I think this config is never turned on in uml,
because of the following definition in drivers/char/Kconfig;

config HW_CONSOLE
	bool
	depends on VT && !S390 && !UML
	default y


thanks,
Hiroshi Shimamoto
