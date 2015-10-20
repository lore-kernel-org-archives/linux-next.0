From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Wed, 21 Oct 2015 09:32:56 +1100
Message-ID: <20151021093256.1198358f@canb.auug.org.au>
References: <20150929114531.2d611a2a@canb.auug.org.au>
	<20151002114932.043376ca@canb.auug.org.au>
	<20151008120424.6813920f@canb.auug.org.au>
	<20151016012639.420c31c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151016012639.420c31c7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>
List-Id: linux-next.vger.kernel.org

Hi Sebastian,

On Fri, 16 Oct 2015 01:26:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 8 Oct 2015 12:04:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 2 Oct 2015 11:49:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > >
> > > On Tue, 29 Sep 2015 11:45:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:    
> > > >
> > > > After merging the battery tree, today's linux-next build (arm
> > > > multi_v7_defconfig) failed like this:
> > > > 
> > > > ERROR (phandle_references): Reference to non-existent node or label "twl4030_madc"
> > > > ERROR: Input tree has errors, aborting (use -f to force output)
> > > > scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/omap3-beagle-xm-ab.dtb' failed
> > > > 
> > > > and many more ...
> > > > 
> > > > Caused by commit
> > > > 
> > > >   af19161aaed7 ("ARM: dts: twl4030: Add iio properties for bci subnode")
> > > > 
> > > > Presumably some updates to other files were missed.
> > > > 
> > > > I have used the battery tree from next-20150925 fot today.    
> > > 
> > > I am still getting this error.    
> > 
> > Ping?  
> 
> I still got this error today ...

And still ... This has been going on for 4 weeks now ... either revert
the commit or get it fixed.  Nothing added to the battery tree since
September 25 has been able to be tested in linux-next.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
