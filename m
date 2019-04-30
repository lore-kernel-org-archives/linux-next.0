From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the arm-soc
 tree
Date: Tue, 30 Apr 2019 10:14:08 +0200
Message-ID: <20190430081408.GB8245@kroah.com>
References: <20190430174051.038c77c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430174051.038c77c8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Patrick Venture <venture@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 30, 2019 at 05:40:51PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   drivers/misc/Kconfig
>   drivers/misc/Makefile
> 
> between commit:
> 
>   524feb799408 ("soc: add aspeed folder and misc drivers")
> 
> from the arm-soc tree and commit:
> 
>   01c60dcea9f7 ("drivers/misc: Add Aspeed P2A control driver")
> 
> from the char-misc tree.
> 
> I fixed it up (see below - though the additions probably want to be
> moved as in the arm-soc commit)

People are still arguing about this, so let's leave this as-is for now
:)

Thanks for the merge resolution,

greg k-h
