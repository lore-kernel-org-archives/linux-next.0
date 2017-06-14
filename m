From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the jc_docs
 tree
Date: Wed, 14 Jun 2017 06:33:46 +0200
Message-ID: <20170614043346.GD10146@kroah.com>
References: <20170614140416.26b97944@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54573 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750744AbdFNEdy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 00:33:54 -0400
Content-Disposition: inline
In-Reply-To: <20170614140416.26b97944@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, "Andrew F. Davis" <afd@ti.com>

On Wed, Jun 14, 2017 at 02:04:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   Documentation/DocBook/w1.tmpl
> 
> between commit:
> 
>   b4c1064a76e7 ("docs-rst: convert w1 book to ReST")
> 
> from the jc_docs tree and commit:
> 
>   f85e8813b2c9 ("DocBook: w1: Update W1 file locations and names in DocBook")
> 
> from the char-misc tree.
> 
> I fixed it up (I removed the file and added the patch below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Jun 2017 14:01:14 +1000
> Subject: [PATCH] docs-rst: merge fix for "DocBook: w1: Update W1 file
>  locations and names in DocBook"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/driver-api/w1.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/w1.rst b/Documentation/driver-api/w1.rst
> index c1da8f0cb476..64826ceba2de 100644
> --- a/Documentation/driver-api/w1.rst
> +++ b/Documentation/driver-api/w1.rst
> @@ -10,12 +10,12 @@ W1 API internal to the kernel
>  W1 API internal to the kernel
>  -----------------------------
>  
> -drivers/w1/w1.h
> -~~~~~~~~~~~~~~~
> +include/linux/w1.h
> +~~~~~~~~~~~~~~~~~~
>  
> -W1 core functions.
> +W1 kernel API functions.
>  
> -.. kernel-doc:: drivers/w1/w1.h
> +.. kernel-doc:: include/linux/w1.h
>     :internal:
>  
>  drivers/w1/w1.c
> @@ -26,20 +26,20 @@ W1 core functions.
>  .. kernel-doc:: drivers/w1/w1.c
>     :internal:
>  
> -drivers/w1/w1_family.h
> +drivers/w1/w1_family.c
>  ~~~~~~~~~~~~~~~~~~~~~~~
>  
>  Allows registering device family operations.
>  
> -.. kernel-doc:: drivers/w1/w1_family.h
> -   :internal:
> +.. kernel-doc:: drivers/w1/w1_family.c
> +   :export:
>  
> -drivers/w1/w1_family.c
> -~~~~~~~~~~~~~~~~~~~~~~~
> +drivers/w1/w1_internal.h
> +~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -Allows registering device family operations.
> +W1 internal initialization for master devices.
>  
> -.. kernel-doc:: drivers/w1/w1_family.c
> +.. kernel-doc:: drivers/w1/w1_internal.h
>     :export:
>  
>  drivers/w1/w1_int.c
> -- 
> 2.11.0
> 

Looks good to me, thanks!

greg k-h
