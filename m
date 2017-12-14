From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: manual merge of the v4l-dvb-next tree with the vfs
 tree
Date: Thu, 14 Dec 2017 14:19:13 -0200
Message-ID: <20171214141913.5c6ede97@vento.lan>
References: <20171211112854.42a7a70a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211112854.42a7a70a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Em Mon, 11 Dec 2017 11:28:54 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb-next tree got a conflict in:
> 
>   drivers/staging/media/lirc/lirc_zilog.c
> 
> between commit:
> 
>   c23e0cb81e40 ("media: annotate ->poll() instances")
> 
> from the vfs tree and commit:
> 
>   28032a347ed0 ("media: staging: remove lirc_zilog driver")
> 
> from the v4l-dvb-next tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

FYI,

I had to rebase the patch series on the top of media tree.

You'll likely be facing the same conflicts with vfs after the
rebase, with different changeset identifiers.


-- 
Thanks,
Mauro
