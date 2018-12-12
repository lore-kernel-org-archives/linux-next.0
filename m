From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the net-next tree with the
 char-misc.current tree
Date: Wed, 12 Dec 2018 09:29:49 +0100
Message-ID: <20181212082949.GC13212@kroah.com>
References: <20181212120252.5260cb22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181212120252.5260cb22@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Sasha Levin <sashal@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 12, 2018 at 12:02:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   cb4f131e1f2c ("MAINTAINERS: Patch monkey for the Hyper-V code")
> 
> from the char-misc.current tree and commit:
> 
>   b255e500c8dc ("net: documentation: build a directory structure for drivers")
> 
> from the net-next tree.
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
> diff --cc MAINTAINERS
> index 4a2a30380bed,a676b40ac1d6..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -6930,11 -6902,9 +6931,11 @@@ Hyper-V CORE AND DRIVER
>   M:	"K. Y. Srinivasan" <kys@microsoft.com>
>   M:	Haiyang Zhang <haiyangz@microsoft.com>
>   M:	Stephen Hemminger <sthemmin@microsoft.com>
>  +M:	Sasha Levin <sashal@kernel.org>
>  +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
>   L:	devel@linuxdriverproject.org
>  -S:	Maintained
>  +S:	Supported
> - F:	Documentation/networking/netvsc.txt
> + F:	Documentation/networking/device_drivers/microsoft/netvsc.txt
>   F:	arch/x86/include/asm/mshyperv.h
>   F:	arch/x86/include/asm/trace/hyperv.h
>   F:	arch/x86/include/asm/hyperv-tlfs.h

Looks good to me, thanks!

greg k-h
