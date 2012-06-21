From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Jun 20 (hweight return type)
Date: Wed, 20 Jun 2012 18:10:09 -0700
Message-ID: <4FE27471.8050505@xenotime.net>
References: <20120620173536.b856bbd97497cf02ddf8d6d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:40362 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755456Ab2FUBKd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jun 2012 21:10:33 -0400
In-Reply-To: <20120620173536.b856bbd97497cf02ddf8d6d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 06/20/2012 12:35 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120619:


Someone changes the return type of __const_hweight8() to
(unsigned long).  That causes printk format warnings when
hweight8/16() etc. is passed a constant:

drivers/input/joystick/analog.c:412:4: warning: format '%d' expects type 'int', but argument 4 has type 'long unsigned int'
drivers/input/joystick/analog.c:412:4: warning: format '%d' expects type 'int', but argument 5 has type 'long unsigned int'
drivers/input/joystick/analog.c:416:5: warning: format '%d' expects type 'int', but argument 5 has type 'long unsigned int'


Note that in

#define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : __arch_hweight8(w))

__arch_hweight*() still returns unsigned int while __const_hweight*()
returns unsigned long.  This can't be good, can it?




-- 
~Randy
