From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: linux-next: Tree for Apr 24 [ PM: Device 1-1.2 failed to resume
 async: error -32 ]
Date: Thu, 25 Apr 2013 13:02:20 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1304251301190.948-100000@iolanthe.rowland.org>
References: <CA+icZUVUd=0oFhPt8Gneze1UyZ5vyGxoEDnBNrya0+mn99nQkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+icZUVUd=0oFhPt8Gneze1UyZ5vyGxoEDnBNrya0+mn99nQkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux PM List <linux-pm-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 25 Apr 2013, Sedat Dilek wrote:

> > That also looks normal.  Did you have CONFIG_USB_DEBUG enabled during
> > this test?  If you did, you could try turning it back off to see if the
> > original problem returns while still doing a usbmon trace.
> >
> 
> As my system works as "expected" after suspend-resume and as you
> pointed out "this is harmless" I am not really willing to do more
> "homework".
> 
> The ipc-sem-next issue has stolen quite bit of my time.
> 
> Thanks for the usbmon hint, now I know for next USB issues what to do.
> And I have never tried my USB-XHCI interface :-).
> 
> /me is just an encouraged Linux-kernel hobbyist.

Okay.  Don't lose hope; lots of people face unexpected issues like 
this.  Good luck!

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
