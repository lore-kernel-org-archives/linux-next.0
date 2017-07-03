From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the char-misc tree with the jc_docs
 tree
Date: Mon, 3 Jul 2017 11:27:22 +1000
Message-ID: <20170703112722.021e6af5@canb.auug.org.au>
References: <20170614140416.26b97944@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170614140416.26b97944@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, "Andrew F. Davis" <afd@ti.com>
List-Id: linux-next.vger.kernel.org

Hi all,

With the merge window opening, just a reminder that this conflict still
exists.

On Wed, 14 Jun 2017 14:04:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
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

-- 
Cheers,
Stephen Rothwell
