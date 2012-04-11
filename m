From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: triage for April 10, 2012
Date: Tue, 10 Apr 2012 23:37:24 -0400
Message-ID: <CAMjpGUeKvP-fJG1sUPRtFDUWCwBg-19JFiFOAKJGmR8Pn4-XUA@mail.gmail.com>
References: <20120410224543.GA11433@windriver.com> <CAMjpGUetfGQxqTKVfLBtOdthxFtFv-knuXSWoNx0BKxJd=829Q@mail.gmail.com>
 <CAP=VYLrzvXCTD4J3sdhMCjnsPKvf-tobkE0G6OgTvc4mnEiw7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:58590 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756084Ab2DKDhq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Apr 2012 23:37:46 -0400
In-Reply-To: <CAP=VYLrzvXCTD4J3sdhMCjnsPKvf-tobkE0G6OgTvc4mnEiw7A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, Sonic Zhang <Sonic.Zhang@analog.com>, Bob Liu <lliubbo@gmail.com>

On Tue, Apr 10, 2012 at 23:09, Paul Gortmaker wrote:
> Thanks Mike, I'll fix the stale link. =C2=A0Here is a RELOC_BFIN_10 f=
ail:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/6087324/

hrm, i'm not seeing that here, but i'm using binutils-2.21.  we prob
should file a bug for the Blackfin toolchain guys to investigate.

what version of binutils are you using ?

> Looks like I should go over the bfin fails and check each one, since
> they are somewhat unique -- e.g.
>
> arch/blackfin/mach-bf537/boards/dnp5370.c:392:17: error:
> 'bfin_spi_board_info' undeclared (first use in this function)
>
> in DNP5370_defconfig

blah, looks like something got renamed, but not all the way

commit 7d157fb02bc3f4dc74e6830725864ba501d92da7
blackfin: config: update macro SPI_BFIN in board file

that renamed SPI_BFIN to SPI_BFIN5XX in the board files

but the commit in drivers/spi/ hasn't been merged yet, so it's still
SPI_BFIN there
-mike
