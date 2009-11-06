From: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Fri, 6 Nov 2009 17:00:26 +1030
Message-ID: <200911061700.27493.rusty@rustcorp.com.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com> <200911051658.36265.rusty@rustcorp.com.au> <20091105173842.c94ba501.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091105173842.c94ba501.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 5 Nov 2009 05:08:42 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> On Thu, 5 Nov 2009 16:58:36 +1030 Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> wrote:
> >
> > Huh?  virtio_has_feature does:
> > 
> > 	if (__builtin_constant_p(fbit))
> > 		BUILD_BUG_ON(fbit >= 32);
> > 	else
> > 		BUG_ON(fbit >= 32);
> 
> In Linus' tree (and linux-next) it looks like this:

Ah.  My patch series fixes that as part of removing MAYBE_BUILD_BUG_ON.

I've put both in for linux-next.

Cheers,
Rusty.
