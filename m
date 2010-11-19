From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for November 19
Date: Fri, 19 Nov 2010 17:42:57 +0000
Message-ID: <20101119174257.58bb8e32@lxorguk.ukuu.org.uk>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
	<AANLkTik6Aq+kWzpmYckKkV5yVMFPt-J0E7OMM6Rd4ouO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTik6Aq+kWzpmYckKkV5yVMFPt-J0E7OMM6Rd4ouO@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 19 Nov 2010 18:40:41 +0100
Zimny Lech <napohybelskurwysynom2010@gmail.com> wrote:

> Salve,
> 
> 2010/11/19 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi all,
> >
> > Changes since 20101118:
> 
> This probably should not be available on x86_64
> 
>   BLD FW  drivers/net/wan/wanxlfw.inc
> /bin/sh: as68k: command not found
> /home/test/linux-2.6/drivers/net/wan/wanxlfw.S:39:0: fatal error: when
> writing output to : Broken pipe
> compilation terminated.
> make[4]: *** [drivers/net/wan/wanxlfw.inc] Error 127

If you want to build the wanxl firmware then you need the m68k assembler
for the firmware, so it is right.
