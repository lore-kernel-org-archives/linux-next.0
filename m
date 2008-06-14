From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Fri, 13 Jun 2008 17:28:02 -0700
Message-ID: <20080614002802.GD25585@kroah.com>
References: <20080610190540.GA25066@kroah.com> <43e72e890806130714k535b041evaf750209ea492c47@mail.gmail.com> <20080613143328.GA16506@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080613143328.GA16506-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 13, 2008 at 10:33:29AM -0400, John W. Linville wrote:
> On Fri, Jun 13, 2008 at 07:14:32AM -0700, Luis R. Rodriguez wrote:
> 
> > This is great. To let this be useful for wireless we'll need
> > wireless-testing.git merged as we rely on it for the latest and
> > greatest. Is this a possibility?
> 
> > We have a few drivers which are not yet ready for
> > wireless-testing.git. Airgo is one.
> > 
> > Anyway, good stuff. Let me know what you think about letting this work
> > for wireless too.
> 
> I don't think directly pulling wireless-testing is a good idea of
> -staging for process-related reasons.  However I think we can arrange
> to send something for the new tree.  at76, airgo, and mrv8k are all
> decent candidates.

Sounds good to me.

> Greg, how does the -staging tree get managed?  Is it periodically
> rebuilt (like -next)?  Or would I need to send you pull requests?

Just send me patches, it's a quilt tree.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
