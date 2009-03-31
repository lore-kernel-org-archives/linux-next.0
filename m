From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: Tree for March 30 (Blackfin string failures again)
Date: Mon, 30 Mar 2009 20:26:40 -0400
Message-ID: <8bd0f97a0903301726j536da9aciaf9eb5e9a7afff5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f160.google.com ([209.85.217.160]:63607 "EHLO
	mail-gx0-f160.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760332AbZCaA0n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2009 20:26:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 30, 2009 at 05:01, Stephen Rothwell wrote:
> The rr tree lost 8 conflicts.

was the Blackfin changes related to the string updates lost or
something ?  the March 30 tree brought in these failures again ...

In file included from include/linux/bitmap.h:9,
                 from include/linux/nodemask.h:90,
                 from include/linux/mmzone.h:17,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:23,
                 from include/linux/module.h:14,
                 from arch/blackfin/lib/strncmp.c:14:
include/linux/string.h: In function 'strstarts':
include/linux/string.h:131: error: implicit declaration of function 'strncmp'
make[1]: *** [arch/blackfin/lib/strncmp.o] Error 1
make: *** [arch/blackfin/lib] Error 2
Last committer:
cc11ee1: Stephen Rothwell <sfr@...>
Merge branch 'quilt/rr'
-mike
