From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 driver-core tree
Date: Wed, 28 Nov 2012 21:17:30 -0800
Message-ID: <20121129051730.GD4375@kroah.com>
References: <20121129160309.7dc352f433d39f1bde0018a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129160309.7dc352f433d39f1bde0018a8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Simon Guinot <simon.guinot@sequanux.org>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 04:03:09PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/leds/leds-ns2.c between commit 98ea1ea20cb7 ("leds: remove use of
> __devinit") from the driver-core tree and commit 72052fcc1026 ("leds:
> leds-ns2: add device tree binding") from the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
