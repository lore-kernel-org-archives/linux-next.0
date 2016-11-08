From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with Linus' tree
Date: Tue, 8 Nov 2016 11:44:40 -0700
Message-ID: <CAGXu5jJFvqCtszv=vNZ1naoecSHcBNfX3y2k+-Sew-5EDbQ8oA@mail.gmail.com>
References: <20161108133130.24c065f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36012 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752445AbcKHSon (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 13:44:43 -0500
Received: by mail-wm0-f47.google.com with SMTP id p190so264479395wmp.1
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2016 10:44:42 -0800 (PST)
In-Reply-To: <20161108133130.24c065f8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On Mon, Nov 7, 2016 at 7:31 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> FIXME: Add owner of second tree to To:
>        Add author(s)/SOB of conflicting commits.
>
> Today's linux-next merge of the kspp tree got a conflict in:
>
>   mm/page_alloc.c
>   scripts/gcc-plugins/latent_entropy_plugin.c
>
> between commits:
>
>   38addce8b600 ("gcc-plugins: Add latent_entropy plugin")
>   0766f788eb72 ("latent_entropy: Mark functions with __latent_entropy")
>   58bea4144d23 ("latent_entropy: Fix wrong gcc code generation with 64 bit variables")
>
> from Linus' tree and commits:
>
>   2a5448668a3c ("gcc-plugins: Add latent_entropy plugin")
>   09dd109d8241 ("latent_entropy: Mark functions with __latent_entropy")
>
> from the kspp tree.
>
> I fixed it up (I used the version from Linus' tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>
> Kees, maybe you could clean up the kspp tree.

Oh, I wonder how that got out of sync. I've updated the kspp tree.

Thanks!

-Kees

-- 
Kees Cook
Nexus Security
