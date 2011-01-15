From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c +
 autofs4)
Date: Sat, 15 Jan 2011 11:08:48 +0000
Message-ID: <20110115110848.GL19804@ZenIV.linux.org.uk>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
 <AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
 <20110115075723.GJ19804@ZenIV.linux.org.uk>
 <20110115090702.GK19804@ZenIV.linux.org.uk>
 <AANLkTinPs5toSudLXuu3=a0RoGHUqYvF8YyhdrXgckXY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinPs5toSudLXuu3=a0RoGHUqYvF8YyhdrXgckXY@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jan 15, 2011 at 12:00:54PM +0100, Sedat Dilek wrote:

> > Argh... ??In __do_follow_link() replace
> >
> > ?? ?? ?? ??if (link->mnt != nd->path.mnt)
> > with
> > ?? ?? ?? ??if (link->mnt == nd->path.mnt)
> >
> > Mismerge yesterday ;-/ ??I've pushed fix for that in for-next, will fold
> > shortly. ??As for autofs4 breakage, I've a preliminary fix, testing it
> > now.
> >
> 
> Hey, cool and thanks.
> 
> Not sure if you catched them all, I have noticed on my latest
> ("buggy") linux-next kernel these Call Traces when doing an
> update-grub.

That might be vfsmount being dropped when it shouldn't or dentry leaked.
And seeing that it's umount(8), I would suspect the latter...

Anyway, with the latest from dhowells we probably should have
d_set_d_op() mess on autofs4 under control (in #for-next).  Whether
it's enough to actually fix the sucker is a separate question, of
course - there might very well be more crap.

I've instrumented mntput() et.al. here; hopefully that'll make catching
the remaining turds easier.  As for dcache leaks... ouch.  Could you
try to reproduce that one on the mainline kernel?  At least that'd
isolate things a bit.
