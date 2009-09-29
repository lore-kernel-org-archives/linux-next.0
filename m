From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: tree build failure
Date: Mon, 28 Sep 2009 17:00:09 -0700
Message-ID: <1254182409.15622.154.camel@slab.beaverton.ibm.com>
References: <20090924152102.8d7d40cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090924152102.8d7d40cf.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: ppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 2009-09-24 at 15:21 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
> 
> In file included from arch/powerpc/kvm/booke.c:31:
> arch/powerpc/kvm/timing.h: In function 'kvmppc_account_exit_stat':
> arch/powerpc/kvm/timing.h:51: error: bit-field '<anonymous>' width not an integer constant
> In file included from arch/powerpc/kvm/booke.h:26,
>                  from arch/powerpc/kvm/booke_emulate.c:23:
> arch/powerpc/kvm/timing.h: In function 'kvmppc_account_exit_stat':
> arch/powerpc/kvm/timing.h:51: error: bit-field '<anonymous>' width not an integer constant
> 
> Presumably caused by commit 8c87df457cb58fe75b9b893007917cf8095660a0
> ("BUILD_BUG_ON(): fix it and a couple of bogus uses of it").

First, I think there is a real bug here, and the code should read like
this (to match the comment):
 	/* type has to be known at build time for optimization */
-	BUILD_BUG_ON(__builtin_constant_p(type));
+	BUILD_BUG_ON(!__builtin_constant_p(type));

However, I get the same build error *both* ways, i.e.
__builtin_constant_p(type) evaluates to both 0 and 1? Either that, or
the new BUILD_BUG_ON() macro isn't working...

> I applied the following patch for today.  This inline function is
> only called from one place in one file ...

It's also called via kvmppc_account_exit() from a number of places.

-- 
Hollis Blanchard
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe kvm-ppc" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
