From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c +
 autofs4)
Date: Sat, 15 Jan 2011 11:34:45 +0000
Message-ID: <20110115113445.GM19804@ZenIV.linux.org.uk>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
 <AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
 <20110115075723.GJ19804@ZenIV.linux.org.uk>
 <20110115090702.GK19804@ZenIV.linux.org.uk>
 <AANLkTinPs5toSudLXuu3=a0RoGHUqYvF8YyhdrXgckXY@mail.gmail.com>
 <20110115110848.GL19804@ZenIV.linux.org.uk>
 <AANLkTinXPgfkcLq6LsQ=dsFZgQK5JG4f4GQW92r95J5C@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinXPgfkcLq6LsQ=dsFZgQK5JG4f4GQW92r95J5C@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jan 15, 2011 at 12:16:29PM +0100, Sedat Dilek wrote:

> Which version do you mean by "mainline"? 2.6.37-git12?
> And with "[mismerge][foldme] breakage in __do_follow_link()" patch [1]?
> I have to look by pulling-in(to) Linus-tree (linux-next) which patches
> are not merged already.

-git12 would do.  Without any extra patches.  Can you reproduce the
ext3 oops on that alone?
