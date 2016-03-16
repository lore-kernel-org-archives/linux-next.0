From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rdma tree with the net-next tree
Date: Wed, 16 Mar 2016 14:01:43 -0700
Message-ID: <CA+55aFw2DxwSDpmkkQvZvQ-Cs1s0Uo5XymhdjrH9C3fmJM6RXA@mail.gmail.com>
References: <20160316115809.61b4478e@canb.auug.org.au>
	<CA+55aFzhYJxCOXER-mhOfJ6=V13Rb5F0LB_3A9n7S_dLkb8f0g@mail.gmail.com>
	<20160317075246.39a08e61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36661 "EHLO
	mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755473AbcCPVBo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 17:01:44 -0400
In-Reply-To: <20160317075246.39a08e61@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, David Miller <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amir Vadai <amir@vadai.me>, Maor Gottlieb <maorg@mellanox.com>

On Wed, Mar 16, 2016 at 1:52 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> How about "This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may want also want to
> consider cooperate with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts."

Yup, sounds fine.

Maybe you could even say "don't merge this to hide the problem",
because that has been another reaction in the past, but the above
already sounds pretty good.

                Linus
