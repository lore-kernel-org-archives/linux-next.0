From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: error while fetching the spi-nor tree
Date: Tue, 12 Dec 2017 14:53:46 -0800
Message-ID: <CA+55aFynbxKc9TgUvcDkMHUn1bnG8pf1MfYgxnHo88LCaVpFqg@mail.gmail.com>
References: <20171213075845.5923cc80@canb.auug.org.au> <12d92a91-bacc-38ae-9906-ac83ed32a0f6@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:34549 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752680AbdLLWxr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Dec 2017 17:53:47 -0500
In-Reply-To: <12d92a91-bacc-38ae-9906-ac83ed32a0f6@wedev4u.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 12, 2017 at 1:24 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
>
> I don't see anything wrong when fetching the tree or when browsing the
> web server:
> http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/spi-nor/next

There's definitely something funky there.

  http://git.infradead.org/l2-mtd.git/commitdiff/f3203415105860e811f4ee9508efd009c9e6525e
  http://git.infradead.org/l2-mtd.git/commitdiff/7a6843af9089b01eab266bbee0ed19f98f09a94a

both show "no differences found". I suspect that's because of git diff
failing due to missing objects.

Most likely reason? Something like an unsafe garbage collect / prune
operation at infradead.org at the same time as you pushed. I don't
know what infradead.org does, but you can definitely do bad things
maintaining a git tree.

I would suggest doing a force-push back to some known-good state, and
then pushing it out again.

Ie, something like

    git push --force infradead.org:l2-mtd.git v4.15-rc1:master

to reset the master branch to v4.15-rc1, and then pushing out again.
And then asking whoever maintains the infradead git trees if something
odd happened..

              Linus
