From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Aug 1
Date: Tue, 1 Aug 2017 15:20:30 +0200
Message-ID: <CAK8P3a2dUdOf4OTLBEMLAVYXSpMyqFSHsRShz7aLEYBjViw61A@mail.gmail.com>
References: <20170801173746.6962444d@canb.auug.org.au> <20170801124204.GA457@jagdpanzerIV.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801124204.GA457@jagdpanzerIV.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 1, 2017 at 2:42 PM, Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
> Hello,
>
>
> seems that commit 979990c6284814617 ("tty: improve tty_insert_flip_char()
> fast path") panics my kernel.
>
> in particular, this part

Looking into it now, sorry for the breakage.

      Arnd
