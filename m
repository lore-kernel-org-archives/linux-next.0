From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for September 3
Date: Wed, 3 Sep 2008 21:54:55 -0700
Message-ID: <20080903215455.792c78a3.akpm@linux-foundation.org>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
	<20080903214634.ea17ff53.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45103 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751399AbYIDEzE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 00:55:04 -0400
In-Reply-To: <20080903214634.ea17ff53.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

On Wed, 3 Sep 2008 21:46:34 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

>  Apart from the lack of any
> login prompt on the console (sshd works), but I suspect that was a
> separate gift.

And the very first damn bisection point goes:

In file included from include/asm/statfs.h:11,
                 from include/linux/statfs.h:6,
                 from include/linux/vfs.h:4,
                 from fs/open.c:22:
include/asm-generic/statfs.h:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__u32'

and that bisection breakage is going to get trotted into mainline
for evermore.

Great.
