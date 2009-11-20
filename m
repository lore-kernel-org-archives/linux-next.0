From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: omap tree misaplied patch
Date: Fri, 20 Nov 2009 12:57:33 -0800
Message-ID: <20091120205731.GB5764@atomide.com>
References: <20091120130228.f3b82588.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091120130228.f3b82588.sfr@canb.auug.org.au>
Sender: linux-omap-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-omap@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [091119 18:01]:
> Hi Tony,
> 
> I think commit 8552f084d80cfc191ea5affacbeffe44e8629496 ("ARM OMAP3:
> RX-51 board - add initialization of gpio keys") has been misapplied.  It
> has this line:
> 
> 	+#endif /* CONFIG_KEYBOARD_GPIO || CONFIG_KEYBOARD_GPIO_MODULE */
> 
> with the leading '+'.   I noticed this when merging with the input tree
> as this made for a strange looking conflict.

Oops, my fault. Will fix ASAP.

Regards,

Tony

