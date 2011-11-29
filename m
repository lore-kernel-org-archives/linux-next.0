From: Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Subject: Re: ore: FIX breakage when MISC_FILESYSTEMS is not set
Date: Tue, 29 Nov 2011 17:36:33 -0500
Message-ID: <1322606193.11286.28.camel@lade.trondhjem.org>
References: <20111124174358.d88f11c0ff700e5e6b3bf73b@canb.auug.org.au>
	  <4ECE91F3.9010007@xenotime.net> <4ED422CC.60706@panasas.com>
	  <4ED4238F.4090407@panasas.com> <4ED4CE58.8090107@tonian.com>
	 <1322588023.4174.28.camel@lade.trondhjem.org>
	 <4ED55B3B.9050207@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ED55B3B.9050207-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Cc: Benny Halevy <bhalevy-4/WYdZTkCtzQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open-osd <osd-dev-yNzVSZO3znNg9hUCZPvPmw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2011-11-29 at 14:22 -0800, Boaz Harrosh wrote: 
> On 11/29/2011 09:33 AM, Trond Myklebust wrote:
> > On Tue, 2011-11-29 at 14:21 +0200, Benny Halevy wrote: 
> >> On 2011-11-29 02:13, Boaz Harrosh wrote:
> 
> >>>
> >>> The solution is to force all users of ORE (exofs, nfs) to manually
> >>> select everything auto-magically selected before.
> >>
> >> How about using "depend ORE" rather than "select ORE"?
> > 
> > Right. Make PNFS_OBJLAYOUT and EXOFS_FS depend on ASYNC_XOR (or select
> > it) and then make ORE depend on EXOFS_FS || PNFS_OBJLAYOUT.
> > 
> > There should be no need to add the 'select ORE'...
> > 
> 
> No! guys!
> 
> One it will not solve my problem because any
> solution that needs to inspect exofs/Kconfig file will
> not work if MISC_FILESYSTEMS is not selected and your
> solutions involve that.

Then move ORE _out_ of MISC_FILESYSTEMS. There is no reason why it needs
to be there as long as the things it depends on are there.

> And two:
> All the user needs to do is Select NFS4.1 everything
> else should be done automatically. He should not need
> to go to misc-filesystems and select ORE so he can have
> pnfs-objects. That's a nightmare.

The solution I proposed didn't involve having the user select anything
other than NFSv4.1 and possibly ASYNC_XOR.

> And anyway the current Kernel rule is that a user of a library
> needs to select it and all it's dependencies, because select
> is not recursive. Now I devised a little skim that can avoid

...and this is _my_ nightmare. I dont' _want_ these selects anywhere in
the NFS subsystem.

-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org
www.netapp.com

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
