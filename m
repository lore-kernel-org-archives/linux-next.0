From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the jc_docs
 tree
Date: Tue, 13 Jun 2017 09:14:50 +0200
Message-ID: <20170613071450.GA27543@kroah.com>
References: <20170613162341.627e2095@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613162341.627e2095@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever <andreas.noever@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 13, 2017 at 04:23:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   Documentation/admin-guide/index.rst
> 
> between commit:
> 
>   504f231cda56 ("doc: ReSTify and split LSM.txt")
> 
> from the jc_docs tree and commit:
> 
>   163f15115203 ("thunderbolt: Add documentation how Thunderbolt bus can be used")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc Documentation/admin-guide/index.rst
> index e14c374aaf60,6d99a7ce6e21..000000000000
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@@ -61,7 -61,7 +61,8 @@@ configure specific aspects of kernel be
>      java
>      ras
>      pm/index
>  +   LSM/index
> +    thunderbolt

Looks good to me, thanks!

greg k-h
