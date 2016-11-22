From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: manual merge of the char-misc tree with the lightnvm
 tree
Date: Tue, 22 Nov 2016 08:59:11 +0100
Message-ID: <62938018-d3b8-d184-9498-e471811e6e27@bjorling.me>
References: <20161122182908.4c961d64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35133 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932221AbcKVH7P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 02:59:15 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so1794879wme.2
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2016 23:59:14 -0800 (PST)
In-Reply-To: <20161122182908.4c961d64@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <jg@lightnvm.io>

On 11/22/2016 08:29 AM, Stephen Rothwell wrote:
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
> 

greg beat me to it. Thanks for fixing it up Stephen.

-matias
