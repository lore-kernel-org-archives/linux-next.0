From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 3 (arc:defconfig build failure)
Date: Tue, 3 Feb 2015 13:11:42 -0800
Message-ID: <20150203211142.GA18473@roeck-us.net>
References: <20150203182010.73624992@canb.auug.org.au>
 <20150203184218.GA20822@roeck-us.net>
 <54D11C84.2060606@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54D11C84.2060606@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 03, 2015 at 02:07:48PM -0500, Peter Hurley wrote:
> On 02/03/2015 01:42 PM, Guenter Roeck wrote:
> > On Tue, Feb 03, 2015 at 06:20:10PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20150202:
> >>
> >> The target-updates tree gained a conflict against Linus' tree.
> >>
> >> The clk tree gained conflicts against the arm-soc tree.
> >>
> >> Non-merge commits (relative to Linus' tree): 7173
> >>  7143 files changed, 301126 insertions(+), 167764 deletions(-)
> >>
> >> ----------------------------------------------------------------------------
> >>
> > Building arc:defconfig ... failed
> > --------------
> > Error log:
> > 
> > drivers/built-in.o: In function `of_setup_earlycon':
> > (.init.text+0xb3e): undefined reference to `arc_early_base_baud'
> > drivers/built-in.o: In function `setup_earlycon':
> > (.init.text+0xcd0): undefined reference to `arc_early_base_baud'
> > make: *** [vmlinux] Error 1
> > 
> > This is due to "ARC: Dynamically determine BASE_BAUD from DeviceTree".
> > arc:defconfig does not define CONFIG_SERIAL_8250 and thus also not
> > CONFIG_SERIAL_8250_CONSOLE, but it looks like it is mandatory
> > after this patch.
> > 
> > Guenter
> 
> Thanks for the report. Does the patch below fix the build breakage?
> 
> Regards,
> Peter Hurley
> 
> --- >% ---
> Subject: [PATCH] ARC: Fix earlycon build breakage
> 
> Commit ffb7fcd66f14 ("ARC: Dynamically determine BASE_BAUD from DeviceTree")
> breaks arc:defconfig build:
> 
>        drivers/built-in.o: In function `of_setup_earlycon':
>        (.init.text+0xb3e): undefined reference to `arc_early_base_baud'
>        drivers/built-in.o: In function `setup_earlycon':
>        (.init.text+0xcd0): undefined reference to `arc_early_base_baud'
>        make: *** [vmlinux] Error 1
> 
> BASE_BAUD is only required for earlycon, which should depend on
> CONFIG_SERIAL_EARLYCON.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>

Yes, that fixes the problem.

Tested-by: Guenter Roeck <linux@roeck-us.net>
