From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the v4l-dvb-next tree with the
 v4l-dvb tree
Date: Tue, 23 Apr 2019 10:12:42 +0200
Message-ID: <CAK8P3a1LDL51KW2jJdOacAxNP=Gk9YSdcP2LfX8ZasLOdcibDg@mail.gmail.com>
References: <20190423105131.7f460991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423105131.7f460991@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 2:51 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the v4l-dvb-next tree got a conflict in:
>
>   drivers/media/platform/Kconfig
>
> between commit:
>
>   63604a143fe1 ("media: seco-cec: fix building with RC_CORE=m")
>
> from the v4l-dvb tree and commit:
>
>   81527254e151 ("media: seco: depend on CONFIG_RC_CORE=y when not a module")
>
> from the v4l-dvb-next tree.
>
> I fixed it up (I just used the v4l-dvb tree version) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thanks!

Both patches are correct, they just use slightly different syntax, so
the merge is fine as well.

     Arnd
