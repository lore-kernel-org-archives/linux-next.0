From: Jann Horn <jannh@google.com>
Subject: Re: linux-next: manual merge of the vfs tree with the netfilter tree
Date: Thu, 7 Dec 2017 01:48:14 +0100
Message-ID: <CAG48ez1itzyi=0_N-DfjJ+LYSTjCkQR-GHNLOSTnR=oOj7nyyQ@mail.gmail.com>
References: <20171207111035.7c22d7c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ot0-f181.google.com ([74.125.82.181]:36794 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751941AbdLGAsf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Dec 2017 19:48:35 -0500
Received: by mail-ot0-f181.google.com with SMTP id d5so5019147oti.3
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2017 16:48:35 -0800 (PST)
In-Reply-To: <20171207111035.7c22d7c0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 7, 2017 at 1:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Al,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   net/netfilter/xt_bpf.c
>
> between commit:
>
>   6ab405114b0b ("netfilter: xt_bpf: add overflow checks")
>
> from the netfilter tree and commit:
>
>   af58d2496b49 ("fix "netfilter: xt_bpf: Fix XT_BPF_MODE_FD_PINNED mode of 'xt_bpf_info_v1'"")
>
> from the vfs tree.
>
> I can't tell if the strlen test from the former is still needed, so I
> just used the vfs tree version for now.

Yeah, both of the checks from the netfilter tree are still necessary
independent of the commit from the vfs tree.

> I fixed it up (see below)

Did you mean to paste in the fixed-up patch below this message?

> and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
