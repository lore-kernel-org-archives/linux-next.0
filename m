From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Fri, 13 Jun 2008 17:27:22 -0700
Message-ID: <20080614002722.GC25585@kroah.com>
References: <20080610190540.GA25066@kroah.com> <43e72e890806130714k535b041evaf750209ea492c47@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <43e72e890806130714k535b041evaf750209ea492c47-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 13, 2008 at 07:14:32AM -0700, Luis R. Rodriguez wrote:
> This is great. To let this be useful for wireless we'll need
> wireless-testing.git merged as we rely on it for the latest and
> greatest. Is this a possibility?

Hm, why?  Is it really needed for you to have this pulled in?  What is
keeping these drivers from being added to the -next tree today?

> We have a few drivers which are not yet ready for
> wireless-testing.git. Airgo is one.

If you have individual drivers, I'd be glad to take them into the tree
if you think it will help out.  Just send me a patch that can build
properly.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
