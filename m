From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the jc_docs tree with the kbuild
 tree
Date: Mon, 3 Jul 2017 12:58:59 +1000
Message-ID: <20170703125859.0678914b@canb.auug.org.au>
References: <20170626111331.5443587b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752143AbdGCC7B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 22:59:01 -0400
In-Reply-To: <20170626111331.5443587b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kamil Rytarowski <n54@gmx.com>

Hi all,

With the merge window opening, just a reminder that this conflict still
exists.

On Mon, 26 Jun 2017 11:13:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   scripts/kernel-doc-xml-ref
> 
> between commit:
> 
>   cb77f0d623ff ("scripts: Switch to more portable Perl shebang")
> 
> from the kbuild tree and commit:
> 
>   52b3f239bb69 ("Docs: clean up some DocBook loose ends")
> 
> from the jc_docs tree.
> 
> I fixed it up (the latter removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
