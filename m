From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Sun, 8 Apr 2018 03:19:56 +0100
Message-ID: <20180408021945.GF30522@ZenIV.linux.org.uk>
References: <20180319170627.04eae43b@canb.auug.org.au>
 <20180403122629.688f2cab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180403122629.688f2cab@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mateusz Guzik <mguzik@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 03, 2018 at 12:26:29PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> On Mon, 19 Mar 2018 17:06:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> > failed like this:
> > 
> > fs/super.c: In function 'do_thaw_all_callback':
> > fs/super.c:942:3: error: implicit declaration of function 'emergency_thaw_bdev'; did you mean 'emergency_remount'? [-Werror=implicit-function-declaration]
> >    emergency_thaw_bdev(sb);
> >    ^~~~~~~~~~~~~~~~~~~
> >    emergency_remount
> > 
> > Caused by commit
> > 
> >   92afc556e622 ("buffer.c: call thaw_super during emergency thaw")
> > 
> > I have reverted that commit for today.
> 
> I am still doing that revert ...

That's interesting, seeing that this commit is *not* in #for-next and
08fdc8a0138a should not have that problem...
