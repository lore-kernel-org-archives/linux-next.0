From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Subject: RE: linux-next: manual merge of the arm tree with Linus' tree
Date: Thu, 30 Jul 2009 20:41:37 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901B7739E@mi8nycmail19.Mi8.com>
References: <20090731103354.5e7fdd42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752228AbZGaAlp@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20090731103354.5e7fdd42.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ryan Mallon <ryan@bluewatersys.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thursday, July 30, 2009 5:34 PM, Stephen Rothwell wrote:
> Hi Russell,
> 
> Today's linux-next merge of the arm tree got a conflict in MAINTAINERS
> between commit 8b58be884a9fd650abb7f7adf3f885fb9cecd79d ("MAINTAINERS:
> coalesce name and email address lines") from Linus' tree and commit
> d19d36672ee379f26b79df985a9a2e5afb3f1df1 ("[ARM] 5599/1: MAINTAINERS:
> update for EP93XX ARM") from the arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Russell,

Stephen's fix below is fine with me.  If needed I will resubmit this patch.

Regards,
Hartley

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc MAINTAINERS
> index 79471ba,1be6a0c..0000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -535,12 -604,18 +535,15 @@@ W:	http://maxim.org.za/at91_26.htm
>   S:	Maintained
>   
>   ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
> - M:	Lennert Buytenhek <kernel@wantstofly.org>
>  -P:	Hartley Sweeten
>  -M:	hsweeten@visionengravers.com
>  -P:	Ryan Mallon
>  -M:	ryan@bluewatersys.com
> ++M:	Hartley Sweeten <hsweeten@visionengravers.com>
> ++M:	Ryan Mallon <ryan@bluewatersys.com>
>   L:	linux-arm-kernel@lists.arm.linux.org.uk (subscribers-only)
>   S:	Maintained
> + F:	arch/arm/mach-ep93xx/
> + F:	arch/arm/mach-ep93xx/include/mach/
>   
>   ARM/CIRRUS LOGIC EDB9315A MACHINE SUPPORT
>  -P:	Lennert Buytenhek
>  -M:	kernel@wantstofly.org
>  +M:	Lennert Buytenhek <kernel@wantstofly.org>
>   L:	linux-arm-kernel@lists.arm.linux.org.uk (subscribers-only)
>   S:	Maintained
  
