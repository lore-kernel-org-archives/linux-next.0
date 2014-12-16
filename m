From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: linux-next: Tree for Dec 16
Date: Mon, 15 Dec 2014 22:44:44 -0800
Message-ID: <20141215224444.dc7f0f3c.akpm@linux-foundation.org>
References: <20141216154622.7c2ded16@canb.auug.org.au>
	<20141216063549.GA1060@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141216063549.GA1060-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, 15 Dec 2014 22:35:49 -0800 Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:

> On Tue, Dec 16, 2014 at 03:46:22PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any code destined for v3.20 to your linux-next included
> > trees/branches until after v3.19-rc1 is released.
> > 
> > Changes since 20141215:
> > 
> > The infiniband tree gained a conflict against Linus' tree and a build
> > failure so I used the version from next-20141215.
> > 
> > The userns tree gained a conflict against the vfs tree.
> > 
> > The clk tree gained a build failure so I used the version from
> > next-20141215.
> > 
> > Non-merge commits (relative to Linus' tree): 3588
> >  2582 files changed, 123494 insertions(+), 135748 deletions(-)
> > 
> 
> My metag buildbot test fails with this kernel.

Thanks.  What are the error messages?

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
