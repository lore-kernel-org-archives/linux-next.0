From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for July 17 (debugobjects: bt | btusb | usb
 related?)
Date: Fri, 20 Jul 2012 11:47:49 +0200
Message-ID: <20120720094748.GA16598@redhat.com>
References: <CA+icZUWXire09owq2Q9bN=C+VKuzSG+48Cz3-Ex+ZaTtGrEmQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUWXire09owq2Q9bN=C+VKuzSG+48Cz3-Ex+ZaTtGrEmQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 18, 2012 at 08:06:17PM +0200, Sedat Dilek wrote:
> On Tue, Jul 17, 2012 at 7:41 AM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
> > Hi all,
> >
> > Changes since 20120716:
> >
> 
> Not sure what the root cause of this issue is.
> 
> I see the following call-trace in linux-next (next-20120717).
> 
> [   23.431889] ------------[ cut here ]------------
> [   23.431896] WARNING: at lib/debugobjects.c:261 debug_print_object+0x8e/0xb0()
> [   23.431897] Hardware name: <HIDDEN>
> [   23.431901] ODEBUG: free active (active state 0) object type:
> timer_list hint: delayed_work_timer_fn+0x0/0x40
There are few delayed works on hci_dev structure, it's hard to say which
one is not stopped before kfree.

> # CONFIG_DEBUG_OBJECTS_WORK is not set
If you enable that option, it should show which delayed work is causing trouble.

Stanislaw
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
