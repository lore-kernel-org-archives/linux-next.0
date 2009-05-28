From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: linux-next: pxa tree build failure
Date: Thu, 28 May 2009 10:36:19 +0800
Message-ID: <f17812d70905271936x58f424deq583357279d24d78a@mail.gmail.com>
References: <20090528025406.781cfc0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f190.google.com ([209.85.221.190]:53856 "EHLO
	mail-qy0-f190.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755310AbZE1CgS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 22:36:18 -0400
In-Reply-To: <20090528025406.781cfc0b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas 'Sleep_Walker' Cech <sleep_walker@suse.cz>, Russell King <rmk@arm.linux.org.uk>

On Thu, May 28, 2009 at 12:54 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
> Today's linux-next build (most of the arm configs) failed like this:
>
> arch/arm/mm/mmu.c:839: error: implicit declaration of function 'machine_is_treo680'
>
> Caused by commit c81fe1207795c71a6933f84d62ded0946a6af8a4 ("[ARM]
> pxa/treo680: initial support").
>

Yeah, that depends on the mach-types being updated, and we are
still discussing about that. I'll temporarily move that commit off the
branch, and put it back once ready.
