From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the jc_docs
 tree
Date: Mon, 24 Sep 2018 07:17:21 +0200
Message-ID: <20180924051721.GA1974@kroah.com>
References: <20180924125016.0f813c15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180924125016.0f813c15@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henrik Austad <henrik@austad.us>, Vladimir Zapolskiy <vz@mleia.com>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 24, 2018 at 12:50:16PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   Documentation/filesystems/00-INDEX
> 
> between commit:
> 
>   a7ddcea58ae2 ("Drop all 00-INDEX files from Documentation/")
> 
> from the jc_docs tree and commit:
> 
>   a779df303b05 ("Documentation: filesystems: remove reminiscences of POHMELFS")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Resolution looks good, thanks!

greg k-h
