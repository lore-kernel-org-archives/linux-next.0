From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 16 (lib/842/842_decompress)
Date: Wed, 16 Dec 2015 12:23:24 -0800
Message-ID: <5671C83C.7@infradead.org>
References: <20151216164343.0cb641ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:46810 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966903AbbLPUX2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2015 15:23:28 -0500
In-Reply-To: <20151216164343.0cb641ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dan Streetman <ddstreet@ieee.org>

On 12/15/15 21:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20151215:
> 
> The drm-misc tree gained a conflict against Linus' tree.
> 
> The i2c tree gained a build failure for which I applied a patch.
> 
> The gpio tree gained a build failure so I used the version from
> next-20151215.
> 

on i386, when CONFIG_PRINTK is not enabled:


../lib/842/842_decompress.c: In function '__do_index':
../lib/842/842_decompress.c:205:2: error: implicit declaration of function 'no_printk' [-Werror=implicit-function-declaration]
  pr_debug("index%x to %lx off %lx adjoff %lx tot %lx data %lx\n",
  ^





-- 
~Randy
