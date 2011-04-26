From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the bluetooth tree
Date: Tue, 26 Apr 2011 05:56:46 -0700
Message-ID: <20110426125646.GB6272@kroah.com>
References: <20110426175530.d27179e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110426175530.d27179e2.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiejing Zhang <kzjeef@gmail.com>, "Gustavo F. Padovan" <padovan@profusion.mobi>, Felipe Balbi <balbi@ti.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 26, 2011 at 05:55:30PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/bluetooth/hci_ldisc.c between commit 78b4a56c28c0 ("Bluetooth:
> hci_uart: check the return value of recv()") from the bluetooth tree and
> commit b1c43f82c5aa ("tty: make receive_buf() return the amout of bytes
> received") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

The fix looks correct to me, thanks for doing this.

greg k-h
