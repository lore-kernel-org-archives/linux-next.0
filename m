From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: hangs on boot in 9984d7394618df9
Date: Mon, 8 Apr 2013 23:46:37 +0100
Message-ID: <20130408224637.GW4068@ZenIV.linux.org.uk>
References: <515F0456.9040803@sgi.com>
 <20130405173623.GE4068@ZenIV.linux.org.uk>
 <515F3A71.9080008@sgi.com>
 <20130405210042.GH4068@ZenIV.linux.org.uk>
 <5162E36F.5020305@sgi.com>
 <20130408155847.GS4068@ZenIV.linux.org.uk>
 <51632DF8.2080402@sgi.com>
 <20130408212327.GU4068@ZenIV.linux.org.uk>
 <20130408214834.GV4068@ZenIV.linux.org.uk>
 <516341ED.5060803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <516341ED.5060803@wwwdotorg.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Nathan Zimmer <nzimmer@sgi.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 08, 2013 at 04:17:17PM -0600, Stephen Warren wrote:
> On 04/08/2013 03:48 PM, Al Viro wrote:
> > On Mon, Apr 08, 2013 at 10:23:27PM +0100, Al Viro wrote:
> >> On Mon, Apr 08, 2013 at 03:52:08PM -0500, Nathan Zimmer wrote:
> >>
> >>> Further digging seems to indicate 9984d7394618df9, the one right
> >>> after the commit I previously identified.
> >>> Not sure what I did wrong with my bisect to put it off by one.
> >>
> >> Ugh...  Can't reproduce here ;-/  Could you give more details on your
> >> setup?
> > 
> > Anyway, I've just pushed a splitup of that commit (carved in 3 pieces)
> > into vfs.git#pipe-splitup; could you check which part triggers that
> > hang?  Should propagate in a few...
> 
> It looks like "pipe: unify ->release() and ->open()" introduces the
> problem. Note that I had to add a prototype for fifo_open() before the
> structs that reference it for that commit to compile.

Very interesting...  Just in case, could you try this on top of that
branch and see if it triggers?

diff --git a/fs/pipe.c b/fs/pipe.c
index 8ce279b..b6cd51b 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -1022,6 +1022,11 @@ static int fifo_open(struct inode *inode, struct file *filp)
 	/* We can only do regular read/write on fifos */
 	filp->f_mode &= (FMODE_READ | FMODE_WRITE);
 
+	if (inode->i_sb->s_magic == PIPEFS_MAGIC) {
+		WARN_ON(filp->f_flags & O_NONBLOCK);
+		filp->f_flags &= ~O_NONBLOCK;
+	}
+
 	switch (filp->f_mode) {
 	case FMODE_READ:
 	/*
