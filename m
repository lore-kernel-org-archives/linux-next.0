From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the lightnvm
 tree
Date: Tue, 22 Nov 2016 10:45:38 -0500
Message-ID: <20161122154538.GO2165@windriver.com>
References: <20161122182908.4c961d64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161122182908.4c961d64@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier =?iso-8859-1?Q?Gonz=E1lez?= <jg@lightnvm.io>
List-Id: linux-next.vger.kernel.org

[linux-next: manual merge of the char-misc tree with the lightnvm tree] On 22/11/2016 (Tue 18:29) Stephen Rothwell wrote:

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

It relied on the new macro builtin_misc_device which came in via
char-misc.  I was going to wait a release but Greg said he'd be willing
to take the patch in his tree concurrently.

P.
--

> -- 
> Cheers,
> Stephen Rothwell
