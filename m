From: Dennis Zhou <dennisszhou@gmail.com>
Subject: Re: linux-next: changes in the maintainership of the percpu tree
Date: Mon, 17 Sep 2018 10:05:20 -0400
Message-ID: <20180917140519.GA91246@dennisz-mbp.dhcp.thefacebook.com>
References: <20180917210339.21ebb029@canb.auug.org.au>
 <CAOS58YNVTVLzBhQSQBkQkh_Zr101L9_cjhPSK3iTQSScjjYFrg@mail.gmail.com>
 <20180918000003.1ecd47b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180918000003.1ecd47b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, Sep 18, 2018 at 12:00:03AM +1000, Stephen Rothwell wrote:
> Hi Dennis,
> 
> On Mon, 17 Sep 2018 07:53:29 -0400 Tejun Heo <tj@kernel.org> wrote:
> >
> > Ah, yeah, please switch the tree to Dennis's for-next branch instead of
> > mine.
> > 
> > Thanks.
> > 
> > On Mon, Sep 17, 2018 at 7:03 AM Stephen Rothwell <sfr@canb.auug.org.au>
> > wrote:
> > 
> > > I noticed commit
> > >
> > >   1194c4154662 ("MAINTAINERS: Make Dennis the percpu tree maintainer")
> > >
> > > Just wondering if this means any changes to the tree/branch I should
> > > fetch or the contacts I should use for the percpu tree in linux-next.
> 
> I have switched the percpu tree to be the for-next branch of
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
> 
> and added you to the contacts for problems with that tree.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

Thanks for switching it over and for the rundown!
Dennis
