From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the gpio tree
Date: Sat, 30 Apr 2016 13:20:43 +0200
Message-ID: <CACRpkdY+nF-2qVvCZU5o7iRMYm2y7kbddBOguZdraFDwaY36jw@mail.gmail.com>
References: <20160427160646.486aa3fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35233 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615AbcD3LUo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Apr 2016 07:20:44 -0400
Received: by mail-ob0-f173.google.com with SMTP id n10so59455127obb.2
        for <linux-next@vger.kernel.org>; Sat, 30 Apr 2016 04:20:44 -0700 (PDT)
In-Reply-To: <20160427160646.486aa3fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiri Slaby <jslaby@suse.cz>

On Wed, Apr 27, 2016 at 8:06 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/cris/Kconfig
>
> between commit:
>
>   f518abf00d50 ("cris: do away with ARCH_REQUIRE_GPIOLIB")
>
> from the gpio tree and commit:
>
>   11eaeaeaa756 ("exit_thread: remove empty bodies")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Thanks!

> This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hm I have the ACK of the CRIS maintainer on the patch to the
GPIO tree, is the left hand not aware what the right hand is doing :D

Anyway: this conflict looks very trivial so I believe Torvalds will
deal with it without problems.

Yours,
Linus Walleij
