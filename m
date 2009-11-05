From: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Thu, 5 Nov 2009 17:07:15 +1030
Message-ID: <200911051707.15561.rusty@rustcorp.com.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com> <20091105112020.33f02552.sfr@canb.auug.org.au> <200911051658.36265.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200911051658.36265.rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 5 Nov 2009 04:58:36 pm Rusty Russell wrote:
> I did a 4.3.3 allmodconfig with this patch on 64-bit a few days back and all
> was fine.  Will try 4.4.0 now.

4.4.1 seems OK (Ubuntu).

This is annoying.  But I'll withdraw the patches; if there's another reason
that 4.4.0 is bad, we can ban it and reintroduce this.  I don't think that
breaking this hack is enough to declare 4.4.0 verboten.

Thanks,
Rusty.
