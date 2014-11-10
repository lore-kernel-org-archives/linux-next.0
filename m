From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Mon, 10 Nov 2014 14:08:04 +0900
Message-ID: <20141110050804.GB16980@kroah.com>
References: <20141110154958.5729e46e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141110154958.5729e46e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 10, 2014 at 03:49:58PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/8250/8250_mtk.c between commit cd92208f6996 ("tty:
> serial: 8250_mtk: Fix quot calculation") from the tty.current tree and
> commit 2a768264eef0 ("tty: serial: Fix mediatek UART driver setting
> baudrate issue") from the tty tree.
> 
> I fixed it up (I just used the version from the tty tree) and can carry
> the fix as necessary (no action is required).

Thanks, I've already resolved this in the tree, so you will not need
this tomorrow.

greg k-h
