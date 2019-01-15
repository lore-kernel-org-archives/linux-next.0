From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Fixes tag needs some work in the nfs-anna tree
Date: Tue, 15 Jan 2019 18:38:11 -0500
Message-ID: <20190115233811.GD26416@windriver.com>
References: <20190116083831.256824cf@canb.auug.org.au>
 <A4B834E5-2DFD-428E-8E24-9F6F6A822B09@oracle.com>
 <s5hbm4hfu45.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5hbm4hfu45.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Chuck Lever <chuck.lever@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

[Re: linux-next: Fixes tag needs some work in the nfs-anna tree] On 15/01/2019 (Tue 23:12) Takashi Iwai wrote:

> On Tue, 15 Jan 2019 22:41:21 +0100,
> Chuck Lever wrote:
> > 
> > Hi Stephen-
> > 
> > On Jan 15, 2019, at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > [I am experimenting with checking the Fixes tags in commits in linux-next.
> > > Please let me know if you think I am being too strict.]
> > > 
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >  deaa5c96c2f7 ("SUNRPC: Address Kerberos performance/behavior regression")
> > > 
> > > has problem with this Fixes tag:
> > > 
> > >  Fixes: 918f3c1fe83c ("SUNRPC: Improve latency for interactive ... ")
> > > 
> > > The subject should match the subject of the fixed commit.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 
> > I shortened the commit title so that the Fixes: line is shorter than 68
> > characters. I can leave these titles alone if that's preferred.
> 
> I've sometimes shorted the subject like the above, too, as I find a
> too long text annoying.  Maybe the partial string matching should
> suffice, especially when it ends with "..." ?

The problem is consistency.  Perhaps you shorten at four words.  A
person searches with five words or 70 chars -  they never see your commit.

The idea of consistency across the "Fixes:" tags is to allow a level of
automated processing so that the creators of the stable releases can do
a lot less manual hands-on processing.  They have enough work to do.

Thanks,
Paul.
--

> 
> 
> thanks,
> 
> Takashi
