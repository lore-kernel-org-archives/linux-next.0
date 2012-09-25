From: Tony Prisk <linux@prisktech.co.nz>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 25 Sep 2012 19:22:56 +1200
Message-ID: <1348557776.18425.2.camel@gitbox>
References: <20120925165603.7676aa78ed5cfbf8a21fb734@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120925165603.7676aa78ed5cfbf8a21fb734@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2012-09-25 at 16:56 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got conflicts in
> arch/arm/mach-vt8500/bv07.c, arch/arm/mach-vt8500/devices-vt8500.c,
> arch/arm/mach-vt8500/devices-wm8505.c, arch/arm/mach-vt8500/devices.c,
> arch/arm/mach-vt8500/devices.h and arch/arm/mach-vt8500/wm8505_7in.c
> between commit 100d45970327 ("ARM: vt8500: Add support for UHCI companion
> controller") from the usb tree and commit e9a91de7602a ("arm: vt8500: Update
> arch-vt8500 to devicetree support") from the arm-soc tree.
> 
> I just removed the files and can carry the fix as necessary (there may be
> more work required).
> 

Removing the files is the correct solution. Shouldn't be any other work
required if the rest of commit e9a91de7602a changes went in.

I'll pull down -next and check it.

Regards

Tony P
