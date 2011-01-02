From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (input
 tree related)
Date: Sun, 2 Jan 2011 00:05:30 -0800
Message-ID: <20110102080530.GC5429@core.coreip.homeip.net>
References: <20101229125129.d48fb6fc.sfr@canb.auug.org.au>
 <20101229023457.GA4206@core.coreip.homeip.net>
 <20101230105130.5d27a82b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101230105130.5d27a82b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 30, 2010 at 10:51:30AM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> On Tue, 28 Dec 2010 18:34:58 -0800 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Dec 29, 2010 at 12:51:29PM +1100, Stephen Rothwell wrote:
> > > 
> > > After merging the final tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > drivers/input/touchscreen/wacom_w8001.c: In function 'w8001_setup':
> > > drivers/input/touchscreen/wacom_w8001.c:287: error: implicit declaration of function 'mdelay'
> > > 
> > > Caused by commit b8fe15cb1b435928f9967d660e925fe7afb32787 ("Input:
> > > wacom_w8001 - support pen or touch only devices").  See Rule 1 in
> > > Documentation/SubmitChecklist.
> > > 
> > > I have reverted that commit for today.
> > 
> > Thank you Stephen, I'll fix this up in my tree.
> 
> I note that this commit has been redone in your tree (as commit
> 11a862ed9f04558e222fa15a5fbd76698fed11ff) but there have been no changes
> to it at all (except the commit date).
> 

Gah, I forgot to do 'git add' before doing 'git commit --amend', should
be better now.

-- 
Dmitry
