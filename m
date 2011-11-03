From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Thu, 3 Nov 2011 08:10:26 -0700
Message-ID: <CA+55aFzmO1O2HRt0_nPDgVKG0Wtj1Go0QmwcgbXgGipLGZCqjg@mail.gmail.com>
References: <20110912120501.764336af05069fa23a371b5e@canb.auug.org.au>
 <4E6D6C0D.60100@codeaurora.org> <20110913115533.403d4fe6d961ccc8ba9b58b7@canb.auug.org.au>
 <20111103130924.5811caec6db378f467006fc3@canb.auug.org.au> <20111103022252.GA23489@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:56304 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755396Ab1KCPKt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Nov 2011 11:10:49 -0400
In-Reply-To: <20111103022252.GA23489@huya.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brown <davidb@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Wed, Nov 2, 2011 at 7:22 PM, David Brown <davidb@codeaurora.org> wrote:
>
> I think I'm just going to have to convince our bootloader people to
> actually pass in the right memory information in the first place.

I have to say that it would be a wonderful change of pace to see fixes
at that level instead of the continual horrible platform hacks.

So an enthusiastic "yes please" from me on that subject,

                  Linus
