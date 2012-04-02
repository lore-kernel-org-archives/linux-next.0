From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Apr 2 (uml)
Date: Mon, 02 Apr 2012 08:32:28 -0700
Message-ID: <4F79C68C.1070100@xenotime.net>
References: <20120402135538.502e6c73f0cb3e6ae0b3436f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:37212 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751553Ab2DBPce (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Apr 2012 11:32:34 -0400
In-Reply-To: <20120402135538.502e6c73f0cb3e6ae0b3436f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>

On 04/01/2012 08:55 PM, Stephen Rothwell wrote:

> Hi all,
> 
> The merge window has closed, so -next is open for busniess.
> 
> Changes since 20120330:



uml defconfig on x86_64:

  CC      arch/um/drivers/mconsole_kern.o
arch/um/drivers/mconsole_kern.c: In function 'stack_proc':
arch/um/drivers/mconsole_kern.c:707:2: error: implicit declaration of function 'switch_to'
make[2]: *** [arch/um/drivers/mconsole_kern.o] Error 1


-- 
~Randy
