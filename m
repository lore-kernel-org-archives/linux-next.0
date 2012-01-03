From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: Tree for Dec 28 (gfs2)
Date: Tue, 03 Jan 2012 11:17:24 +0000
Message-ID: <1325589444.2685.25.camel@menhir>
References: <20111228201806.d6de27fa2dbd9e3a3b7a2603@canb.auug.org.au>
	 <4EFB859F.7000707@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EFB859F.7000707@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, cluster-devel@redhat.com, David Teigland <teigland@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Wed, 2011-12-28 at 13:09 -0800, Randy Dunlap wrote:
> On 12/28/2011 01:18 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > I got bored :-(  I also hate tree wide, flag day changes :-(
> > 
> > Changes since 20111222:
> 
> 
> modular:
> ERROR: "gfs2_control_wq" [fs/gfs2/gfs2.ko] undefined!
> 
> or builtin:
> main.c:(.init.text+0x313b): undefined reference to `gfs2_control_wq'
> main.c:(.exit.text+0x6a2): undefined reference to `gfs2_control_wq'
> 
> 
> 
> Modular randconfig file is attached.
> 
> 
I think that might be a mistake in the dlm -next tree. The patch in
question is in the dlm tree only because that is where the prerequisites
are also. However the patch (the final one in a series of mostly dlm
related patches) is still under review, even though the prior patches
are all ready,

Steve.
