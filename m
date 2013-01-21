From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Mon, 21 Jan 2013 13:02:38 -0800
Message-ID: <20130121210238.GC9184@kroah.com>
References: <20130121144604.3c2f94e93ce6252aa43d3d9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130121144604.3c2f94e93ce6252aa43d3d9e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Tony Prisk <linux@prisktech.co.nz>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 21, 2013 at 02:46:04PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/vt8500_serial.c between commit a6dd114e16cb ("tty:
> serial: vt8500: fix return value check in vt8500_serial_probe()") from
> Linus' tree and commit 12faa35ae5cb ("serial: vt8500: UART uses gated
> clock rather than 24Mhz reference") from the tty tree.
> 
> I fixed it up (I just used the tty tree version - which included the
> former fix) and can carry the fix as necessary (no action is required).

That sounds correct, thanks.

greg k-h
