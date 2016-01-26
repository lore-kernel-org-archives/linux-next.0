From: Chris Mason <clm@fb.com>
Subject: Re: Add my git tree for linux-next
Date: Mon, 25 Jan 2016 19:59:14 -0500
Message-ID: <20160126005914.n5zvov6q3v23hvad@floor.thefacebook.com>
References: <20160125182445.GA8567@twin.jikos.cz>
 <20160126101616.682677d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-btrfs-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160126101616.682677d4@canb.auug.org.au>
Sender: linux-btrfs-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.cz>, linux-next@vger.kernel.org, linux-btrfs@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Jan 26, 2016 at 10:16:16AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> On Mon, 25 Jan 2016 19:24:45 +0100 David Sterba <dsterba@suse.cz> wrote:
> >
> > please add my git tree to linux-next branches
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> > 
> > It's not populated yet, I'm planning to add namely other developer
> > patchsets (targeting the next release cycle) as I'm able to review them.
> > I won't track all pending patchsets nor all single patches that go to
> > the mailinglist, due to time reasons.
> 
> What subsystem will these patches relate to? (just btrfs)?  Will you be sending pull
> requests?  To whom? (Chris and Josef)?  If so, how will this be
> different to the current btrfs tree?

Dave is one of the btrfs maintainers, and I frequently pull in his trees
directly for my pull requests to Linus.  Getting them earlier exposure in
linux-next will definitely help.

If we ever share the pull-request duties to Linus, it'll also be important to
have Dave's trees in there.

-chris
