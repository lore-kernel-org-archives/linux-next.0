From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: tree build failure
Date: Mon, 19 Oct 2009 18:29:53 -0700
Message-ID: <1256002193.6546.2.camel@slab>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	 <4AD6EB17020000780001A050@vpn.id2.novell.com>
	 <1255976369.13995.98.camel@slab.beaverton.ibm.com>
	 <200910201142.34006.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200910201142.34006.rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Cc: Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, 2009-10-20 at 11:42 +1030, Rusty Russell wrote:
> On Tue, 20 Oct 2009 04:49:29 am Hollis Blanchard wrote:
> > On Thu, 2009-10-15 at 08:27 +0100, Jan Beulich wrote:
> > > My perspective is that it just uncovered already existing brokenness.
> > 
> > Sorry, I thought it was clear, but to be more explicit: I propose the
> > following patch, which replaces the current BUILD_BUG_ON implementation
> > with Rusty's version.
> 
> OK, I switched my brain back on.  Yeah, I agree: we may still want
> BUILD_OR_RUNTIME_BUG_ON one day, but I like this.
> 
> It's just missing the giant comment that it needs :)
> 
> /**
>  * BUILD_BUG_ON - break compile if a condition is true.
>  * @cond: the condition which the compiler should know is false.
>  *
>  * If you have some code which relies on certain constants being equal, or
>  * other compile-time-evaluated condition, you should use BUILD_BUG_ON to
>  * detect if someone changes it.
>  *
>  * The implementation uses gcc's reluctance to create a negative array, but
>  * gcc (as of 4.4) only emits that error for obvious cases (eg. not arguments
>  * to inline functions).  So as a fallback we use the optimizer; if it can't
>  * prove the condition is false, it will cause a link error on the undefined
>  * "__build_bug_on_failed".  This error is less neat, and can be harder to
>  * track down.
>  */

Do you want to put together a signed-off patch Rusty? It's your code, so
I don't feel comfortable doing that.

Once we have that, can we remove the mysterious MAYBE_BUILD_BUG_ON
statements introduced in previous patches? (Does it BUG or doesn't it??)

-- 
Hollis Blanchard
IBM Linux Technology Center
