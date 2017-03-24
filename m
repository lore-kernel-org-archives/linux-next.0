From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Fri, 24 Mar 2017 12:39:04 -0400
Message-ID: <CAHC9VhTg01RvbUAK6th6aYJuiyZFj4eoavHktyrsaEPfCuuJUA@mail.gmail.com>
References: <20170324131810.0b70ebbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f53.google.com ([209.85.213.53]:35747 "EHLO
        mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751520AbdCXQjG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Mar 2017 12:39:06 -0400
Received: by mail-vk0-f53.google.com with SMTP id r69so9320804vke.2
        for <linux-next@vger.kernel.org>; Fri, 24 Mar 2017 09:39:05 -0700 (PDT)
In-Reply-To: <20170324131810.0b70ebbf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Richard Guy Briggs <rgb@redhat.com>

On Thu, Mar 23, 2017 at 10:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   net/netfilter/xt_AUDIT.c
>
> between commit:
>
>   613dbd95723a ("netfilter: x_tables: move hook state into xt_action_param structure")
>
> from Linus' tree and commit:
>
>   36fe46d172e5 ("audit: normalize NETFILTER_PKT")
>
> from the audit tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> P.S. You may want to consider a newer base for your tree ...

FWIW, the audit/next tree's base is old-ish for a reason; it is that
way out of awkwardness and not neglect.  Depending on how things go
today/this-weekend there are some audit patches in the queue which
will require a rebase to a much more current point in time (likely a
4.11-rcX tag, which presents its own challenges, but oh well).

-- 
paul moore
www.paul-moore.com
