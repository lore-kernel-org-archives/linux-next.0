From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 21 Sep 2011 22:44:04 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109212243000.12663@xanadu.home>
References: <20110922114923.86a2325300e87eeaef151b1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110922114923.86a2325300e87eeaef151b1a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thu, 22 Sep 2011, Stephen Rothwell wrote:

> Hi Arnd,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-nuc93x/Makefile.boot between commit 86783a0c544d ("ARM:
> 7022/1: allow to detect conflicting zreladdrs") from the arm tree and
> commit 6adc1e7ff19d ("ARM: mach-nuc93x: delete") from the arm-soc tree.
> 
> The latter removes the file that the former updates, so i did that.

That is correct.


Nicolas
