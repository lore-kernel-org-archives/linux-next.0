From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
Date: Wed, 21 Sep 2011 07:06:32 -0700
Message-ID: <20110921140632.GB19567@kroah.com>
References: <20110921145023.e38d553e218c8b5a2e71e9d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110921145023.e38d553e218c8b5a2e71e9d8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jamie Iles <jamie@jamieiles.com>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 21, 2011 at 02:50:23PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/8250.c between commit 7df5659eefad ("serial/8250: Move
> UPIO_TSI to powerpc") from the powerpc tree and commit 4834d0289785
> ("tty: serial8250: remove UPIO_DWAPB{,32}") from the tty tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks great, thanks.

greg k-h
