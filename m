From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: linux-next: build failure after merge of the omap_dss2 tree
Date: Tue, 18 Nov 2014 16:07:19 +0100
Message-ID: <CANq1E4SMLHmezfXSENSQ8xUaXptwA8YKQ9Nne=sDCB0gPkPLmA@mail.gmail.com>
References: <20141117190905.4e96294a@canb.auug.org.au>
	<546B5D5A.8020304@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <546B5D5A.8020304@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hans de Goede <hdegoede@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Luc Verhaegen <libv@skynet.be>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi

On Tue, Nov 18, 2014 at 3:53 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> Hi,
>
> Thanks Stephen!
>
> Hans, have you had a look at this? kbuild test bot also reported this.

The fix from Stephen should not go to main-line. It breaks simplefb on
x86 without OF. Imo, linux/clk.h should provide a fallback if OF is
not defined (like it already does for of_clk_get() and friends).

Hans, any comments?

Thanks
David
