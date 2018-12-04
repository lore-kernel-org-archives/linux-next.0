From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Tue, 4 Dec 2018 08:42:41 +0100
Message-ID: <20181204074241.GB27141@kroah.com>
References: <20181204153513.1e799336@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204153513.1e799336@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 04, 2018 at 03:35:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/hv/channel_mgmt.c
> 
> between commit:
> 
>   37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels to two workqueues")
> 
> from the char-misc.current tree and commit:
> 
>   4d3c5c69191f ("Drivers: hv: vmbus: Remove the useless API vmbus_get_outgoing_channel()")
> 
> from the char-misc tree.
> 
> I fixed it up (I used the former version where they conflicted) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Yeah, this is a mess, I'll wait for the hyper-v developers to send me a
fixup patch for handling this merge issue, as they know it is happening
:(

thanks,

greg k-h
