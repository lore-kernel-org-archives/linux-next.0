From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Tue, 28 Jul 2009 11:26:08 +0100
Message-ID: <20090728112608.09a494e0@lxorguk.ukuu.org.uk>
References: <20090728140110.7cfe7c22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751597AbZG1KZN@vger.kernel.org>
In-Reply-To: <20090728140110.7cfe7c22.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Tue, 28 Jul 2009 14:01:10 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/usb-serial.c between commit
> a00b8d98aca97bfb6fa983f41dae25b424058592 ("USB: fix usage count in usb
> serial generic open regarding autoresume") from the usb.current tree

That looks wrong. The extra fiddling with port.count looks both unsafe
and incorrect. I've never seen the "autoresume" patch referred to so I've
no idea what it is trying to do

Greg ?
