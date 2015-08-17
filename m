From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 17 (mshyperv.c)
Date: Mon, 17 Aug 2015 10:34:50 -0700
Message-ID: <55D21B3A.2090109@infradead.org>
References: <20150817205533.72ebb3fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:39041 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbHQRfD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2015 13:35:03 -0400
In-Reply-To: <20150817205533.72ebb3fb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>

On 08/17/15 03:55, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150813:
> 

on i386 (for several days now):

when CONFIG_KEXEC is not enabled:


arch/x86/built-in.o: In function `hv_machine_crash_shutdown':
mshyperv.c:(.text+0x2d9d4): undefined reference to `native_machine_crash_shutdown'



-- 
~Randy
