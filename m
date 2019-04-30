From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the pm tree
Date: Tue, 30 Apr 2019 10:13:44 +0200
Message-ID: <20190430081344.GA8245@kroah.com>
References: <20190430174829.4f33e8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430174829.4f33e8b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 30, 2019 at 05:48:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   Documentation/driver-api/index.rst
> 
> between commit:
> 
>   680e6ffa1510 ("Documentation: add Linux ACPI to Sphinx TOC tree")
> 
> from the pm tree and commit:
> 
>   09e7d4ed8991 ("docs: Add Generic Counter interface documentation")
> 
> from the staging tree.
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
> diff --cc Documentation/driver-api/index.rst
> index aa87075c7846,201247b7c1e8..000000000000
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@@ -56,7 -56,7 +56,8 @@@ available subsections can be seen below
>      slimbus
>      soundwire/index
>      fpga/index
>  +   acpi/index
> +    generic-counter

Looks good to me, thanks!

greg k-h
