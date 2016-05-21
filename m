From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Fri, 20 May 2016 20:26:47 -0700
Message-ID: <20160521032647.GA6509@kroah.com>
References: <20160520123151.0c8a7c47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160520123151.0c8a7c47@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Ralf Baechle <ralf@linux-mips.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 20, 2016 at 12:31:51PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   include/uapi/linux/serial_core.h
> 
> between commits:
> 
>   157b9394709e ("serial: pic32_uart: Add PIC32 UART driver")
>   07b75260ebc2 ("Merge branch 'upstream' of git://git.linux-mips.org/pub/scm/ralf/upstream-linus")
> 
> from Linus' tree and commit:
> 
>   041f031def33 ("serial: mps2-uart: add MPS2 UART driver")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for this, I've warned Linus to watch out for this when he merges
my tree into his.

greg k-h
