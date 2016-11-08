From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the jc_docs tree
Date: Tue, 8 Nov 2016 11:15:54 +0100
Message-ID: <20161108101554.GA17244@kroah.com>
References: <20161108163013.24d165f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161108163013.24d165f3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Jiri Slaby <jslaby@suse.cz>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 08, 2016 at 04:30:13PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   Documentation/VGA-softcursor.txt
> 
> between commits:
> 
>   27641b953c54 ("Documentation/VGA-softcursor.txt: convert to ReST markup")
>   9d85025b0418 ("docs-rst: create an user's manual book")
> 
> from the jc_docs tree and commit:
> 
>   b9c8b7fc252c ("vgacon: remove prehistoric macros")
> 
> from the tty tree.
> 
> I fixed it up (I deleted it - since 9d85025b0418 moved it - but that
> means it may need fixing up in its new location to match any relevant
> changes in b9c8b7fc252c) and can carry the fix as necessary. This is
> now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks, I'll work on sending a documentation patch after 4.10-rc1 to fix
this up.

greg k-h
