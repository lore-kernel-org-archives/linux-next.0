From: Karsten Keil <keil@b1-systems.de>
Subject: Re: linux-next:  tree build failure
Date: Mon, 27 Jul 2009 11:21:33 +0200
Message-ID: <200907271121.34348.keil@b1-systems.de>
References: <20090727175328.fe3197a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755847AbZG0JVj@vger.kernel.org>
In-Reply-To: <20090727175328.fe3197a5.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,


On Montag, 27. Juli 2009 09:53:28 you wrote:
> Hi Dave,
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> drivers/isdn/hisax/built-in.o: In function `setup_w6692':
> (.opd+0x4a28): multiple definition of `setup_w6692'
> drivers/isdn/hardware/built-in.o:(.opd+0x4e90): first defined here
> drivers/isdn/hisax/built-in.o: In function `.setup_w6692':
> (.devinit.text+0x5b14): multiple definition of `.setup_w6692'
> drivers/isdn/hardware/built-in.o:(.text+0x8b75c): first defined here
>
> Caused by commit 707b2ce6c1f4f1261788f2ff09ad82c35e0e6240
> ("mISDN: Add driver for Winbond cards").
>
> setup_w6692 appears in drivers/isdn/hardware/mISDN/w6692.c and
> drivers/isdn/hisax/w6692.c.  I applied the patch below for today (this
> may not be correct).
>

Sorry for that, yes this fix is correct - I really should test allyesconfig 
more times by myself  :-(.

ACK.

> [I also get these warnings:
> drivers/isdn/hardware/mISDN/w6692.c:533: warning: 'setvolume' defined but
> not used drivers/isdn/hardware/mISDN/w6692.c:560: warning: 'enable_pots'
> defined but not used ]

The POTS code is implemented, but the higher level interface is not finally 
defined yet, so the two functions are not used at the moment.
The interface will added soon.


> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 27 Jul 2009 17:45:36 +1000
> Subject: [PATCH] net: fix multiple definitions of setup_w6692
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/isdn/hardware/mISDN/w6692.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/isdn/hardware/mISDN/w6692.c
> b/drivers/isdn/hardware/mISDN/w6692.c index 1b9008f..d3f1077 100644
> --- a/drivers/isdn/hardware/mISDN/w6692.c
> +++ b/drivers/isdn/hardware/mISDN/w6692.c
> @@ -1234,7 +1234,7 @@ w6692_dctrl(struct mISDNchannel *ch, u32 cmd, void
> *arg) return err;
>  }
>
> -int
> +static int
>  setup_w6692(struct w6692_hw *card)
>  {
>  	u32	val;
