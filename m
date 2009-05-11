From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: Re: next: build fails at fs/lockd/svclock.c
Date: Mon, 11 May 2009 14:46:00 -0400
Message-ID: <20090511184600.GD793@fieldses.org>
References: <a4423d670905040623q48eb552ft3bd107d6aa71d63b@mail.gmail.com> <1241444370.5754.5.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1241444370.5754.5.camel-rJ7iovZKK19ZJLDQqaL3InhyD016LWXt@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Blyakher <felixb-sJ/iWh9BUns@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, May 04, 2009 at 09:39:30AM -0400, Trond Myklebust wrote:
> On Mon, 2009-05-04 at 17:23 +0400, Alexander Beregalov wrote:
> > Hi
> > 
> > Randconfig fails like this
> > 
> > fs/lockd/svclock.c: In function 'nlmsvc_freegrantargs':
> > fs/lockd/svclock.c:330: error: implicit declaration of function
> > 'locks_release_private'
> > 
> > caused by a9e61e25f9d2
> > (lockd: call locks_release_private to cleanup per-filesystem state)
> > 
> > 
> > # CONFIG_FILE_LOCKING is not set
> > CONFIG_LOCKD=y
> > --
> 
> See the posting "[PATCH v2] lockd: fix FILE_LOCKING=n build error" by
> Randy Dunlap last Tuesday.

What happened to this--is it in some maintainer's tree now?

--b.
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
