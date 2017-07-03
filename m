From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kspp tree with the file-locks
 tree
Date: Mon, 3 Jul 2017 22:57:19 +1000
Message-ID: <20170703225719.7c323d6a@canb.auug.org.au>
References: <20170621163211.35abbb57@canb.auug.org.au>
        <20170703114807.70d7624d@canb.auug.org.au>
        <1499077647.4737.2.camel@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752038AbdGCM5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 08:57:22 -0400
In-Reply-To: <1499077647.4737.2.camel@poochiereds.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jeff,

On Mon, 03 Jul 2017 06:27:27 -0400 Jeff Layton <jlayton@poochiereds.net> wrote:
>
> I think this is fairly trivial conflict -- Kees is adding the
> __randomize_layout attribute here, and I'm just adding a field to each
> of these structs.

Yep, nothing too tricky here.

> The main catch is that both of these branches have a fair number of
> preparatory patches before the above changes occur, so pulling one into
> the other is not trivial.
> 
> Would it be best to just send the PRs to Linus and have him fix this up
> in the final merge?

Absolutely the right thing to do.  The reminder is mainly so you can
just mention the conflict to Linus.

-- 
Cheers,
Stephen Rothwell
