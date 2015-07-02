From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] staging: make board support depend on OF_IRQ and
 CLKDEV_LOOKUP
Date: Thu, 2 Jul 2015 06:54:18 -0700
Message-ID: <20150702135418.GA4979@roeck-us.net>
References: <CAMuHMdWS_-=yn8n2_UruwDjK3tnWg6GWkn3PEe4DBNMAEOZOVA@mail.gmail.com>
 <1434842903-24708-1-git-send-email-paul.gortmaker@windriver.com>
 <558C0C82.3080709@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43566 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753549AbbGBNyW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2015 09:54:22 -0400
Content-Disposition: inline
In-Reply-To: <558C0C82.3080709@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Jun 25, 2015 at 10:13:22AM -0400, Paul Gortmaker wrote:
> On 15-06-20 07:28 PM, Paul Gortmaker wrote:
> > Building allmodconfig for arch/cris currently fails with:
> > 
> > drivers/built-in.o: In function `board_staging_register_clock':
> > drivers/staging/board/board.c:131: undefined reference to `clk_add_alias'
> > make: *** [vmlinux] Error 1
> 
> Just checking this didn't fall through the cracks, as its absence
> causes several arch breakage on linux-next for several days now:
> 
> (.init.text+0xf968): undefined reference to `clk_add_alias'
> 
>  
> x86:     http://kisskb.ellerman.id.au/kisskb/buildresult/12448913/
> powerpc: http://kisskb.ellerman.id.au/kisskb/buildresult/12449785/
> parisc:  http://kisskb.ellerman.id.au/kisskb/buildresult/12449940/
> 
This problem is now seen in mainline.

Also affected: alpha:allmodconfig, mips:allmodconfig, s390:allmodconfig.

and applying the patch fixes the problem.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
