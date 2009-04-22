From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Subject: RE: linux-next: Tree for April 22 [BUG] ep93xx_keypad_open:undefined reference to `clk_set_rate'
Date: Wed, 22 Apr 2009 12:55:28 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090165EF9B@mi8nycmail19.Mi8.com>
References: <20090422154247.dbffd285.sfr@canb.auug.org.au> <20090422084104.GB20105@traven>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756111AbZDVQ4I@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20090422084104.GB20105@traven>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <matthias@kaehlcke.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: linux-next.vger.kernel.org

On Wednesday, April 22, 2009 1:41 AM, Matthias Kaehlcke wrote:
> hi,
>
> the driver for the Cirrus Logic EP93xx keypad matrix relies on the
> function clk_set_rate() which (still) isn't defined for ep93xx:
>
> drivers/built-in.o: In function `ep93xx_keypad_open':
> hid-quirks.c:(.text+0x61aa0): undefined reference to `clk_set_rate'

I didn't realize the EP93xx keypad matrix driver made it to linux-next.
Hmm...

For the driver to function it requires a patch to
arch/arm/mach-ep93xx/clock.c that adds the necessary clk resource and
the clk_set_rate support.

I have a patch for this but I am waiting on a response on another
patch that it depends on.  If needed I can modify the patch so that it
will apply now.

Regards,
Hartley
