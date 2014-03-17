From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the tip tree
Date: Mon, 17 Mar 2014 11:30:52 -0700
Message-ID: <20140317183052.GD10565@kroah.com>
References: <20140317183126.7c8ba1901c81fbb9ace00f20@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140317183126.7c8ba1901c81fbb9ace00f20@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Magnus Damm <damm@opensource.se>, Daniel Lezcano <daniel.lezcano@linaro.org>, Wolfram Sang <wsa@sang-engineering.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 17, 2014 at 06:31:26PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> arch/arm/mach-shmobile/Kconfig between commit aeb8fb7910fc ("ARM:
> shmobile: Remove CMT, TMU and STI Kconfig entries") from the tip tree and
> commit f6723b569a67 ("usb: host: remove selects of USB_ARCH_HAS_?HCI")
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
