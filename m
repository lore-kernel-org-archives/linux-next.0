From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: tree build failure
Date: Tue, 29 Sep 2009 16:39:32 -0700
Message-ID: <1254267572.15622.1621.camel@slab.beaverton.ibm.com>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4AC1E15502000078000516B5-Qfbpwmsw6RoS3W1tAdPHOtBPR1lH4CV8@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Beulich <jbeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, 2009-09-29 at 10:28 +0100, Jan Beulich wrote:
> >>> Hollis Blanchard  09/29/09 2:00 AM >>>
> >First, I think there is a real bug here, and the code should read like
> >this (to match the comment):
> >    /* type has to be known at build time for optimization */
> >-    BUILD_BUG_ON(__builtin_constant_p(type));
> >+    BUILD_BUG_ON(!__builtin_constant_p(type));
> >
> >However, I get the same build error *both* ways, i.e.
> >__builtin_constant_p(type) evaluates to both 0 and 1? Either that, or
> >the new BUILD_BUG_ON() macro isn't working...
> 
> No, at this point of the compilation process it's neither zero nor one,
> it's simply considered non-constant by the compiler at that stage
> (this builtin is used for optimization, not during parsing, and the
> error gets generated when the body of the function gets parsed,
> not when code gets generated from it).

I think I see what you're saying. Do you have a fix to suggest?

-- 
Hollis Blanchard
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe kvm-ppc" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
