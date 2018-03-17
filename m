From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: linux-next: manual merge of the rtc tree with the asm-generic
 tree
Date: Sat, 17 Mar 2018 14:22:52 +0100
Message-ID: <20180317132252.GG4123@piout.net>
References: <20180315185917.3316d781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180315185917.3316d781@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 15/03/2018 at 18:59:17 +1100, Stephen Rothwell wrote:
> Hi Alexandre,
> 
> Today's linux-next merge of the rtc tree got a conflict in:
> 
>   drivers/rtc/rtc-tile.c
> 
> between commit:
> 
>   909ce75a0665 ("rtc: remove tile driver")
> 
> from the asm-generic tree and commit:
> 
>   1fbcb2aa1d64 ("rtc: tile: remove useless message")
> 
> from the rtc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I've removed the patch from my tree as there is no point in modifying a
driver that is removed.


-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
