From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Wed, 3 Apr 2019 06:06:54 +0100
Message-ID: <b5e42db8-a873-5667-f179-78cadf5b2bf5@linaro.org>
References: <20190403145609.6eda97b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403145609.6eda97b6@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bo YU <tsu.yubo@gmail.com>
List-Id: linux-next.vger.kernel.org


On 03/04/2019 04:56, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>    drivers/misc/fastrpc.c
> 
> between commit:
> 
>    01b76c32e3f3 ("misc: fastrpc: add checked value for dma_set_mask")
> 
> from the char-misc.current tree and commit:
> 
>    977e6c8d1d18 ("misc: fastrpc: use correct spinlock variant")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
Greg did request Bo YU to rebase this patch on top of char-misc tree.

That would be a real fix for this conflict, until then this fixup should 
work.

--srini
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
