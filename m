From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 24 (irqchip)
Date: Mon, 24 Sep 2012 08:39:05 -0700
Message-ID: <50607E99.6040303@xenotime.net>
References: <20120925005328.f748dfa3d077cebb345a4291@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120925005328.f748dfa3d077cebb345a4291@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 09/24/2012 07:53 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Today was a train wreck, with lots of new conflicts across several trees
> and a few build failures as well.


I agree.  I mostly get this:

drivers/Kconfig:157: can't open file "drivers/irqchip/Kconfig"

i.e., no such file.

How does this happen?  :(

who handles irqchip?

> -- 

~Randy
