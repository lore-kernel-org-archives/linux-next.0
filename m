From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the lightnvm
 tree
Date: Tue, 22 Nov 2016 08:58:18 +0100
Message-ID: <20161122075818.GA7768@kroah.com>
References: <20161122182908.4c961d64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55624 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755187AbcKVH6K (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 02:58:10 -0500
Content-Disposition: inline
In-Reply-To: <20161122182908.4c961d64@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Javier =?iso-8859-1?Q?Gonz=E1lez?= <jg@lightnvm.io>

On Tue, Nov 22, 2016 at 06:29:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/lightnvm/core.c
> 
> between commit:
> 
>   7b0d392f6957 ("lightnvm: remove sysfs configuration interface")
> 
> from the lightnvm tree and commit:
> 
>   389b2a1c0e90 ("lightnvm: make core.c explicitly non-modular")
> 
> from the char-misc tree.
> 
> I fixed it up (the former removed the code that was commented by the
> latter, so I just removed it) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> I do wonder why commit 389b2a1c0e90 is in the char-misc tree and not
> the lightnvm or block trees?

Because of a call to builtin_misc_device() which came into the char-misc
tree.  Thanks for resolving the merge issue.

greg k-h
