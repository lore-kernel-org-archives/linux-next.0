From: Ming Lei <ming.lei@redhat.com>
Subject: Re: 4.16 genirq change prevents HP servers from booting [was: Re:
 linux-next: Signed-off-by missing for commit in the device-mapper tree]
Date: Mon, 15 Jan 2018 23:33:01 +0800
Message-ID: <20180115153300.GB13816@ming.t460p>
References: <20180116002736.4d464214@canb.auug.org.au>
 <20180115152501.GA24239@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-block-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180115152501.GA24239@redhat.com>
Sender: linux-block-owner@vger.kernel.org
To: Mike Snitzer <snitzer@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurence Oberman <loberman@redhat.com>, axboe@kernel.dk, linux-block@vger.kernel.org, hch@lst.de
List-Id: linux-next.vger.kernel.org

On Mon, Jan 15, 2018 at 10:25:01AM -0500, Mike Snitzer wrote:
> On Mon, Jan 15 2018 at  8:27am -0500,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Commit
> > 
> >   34e1467da673 ("Revert "genirq/affinity: assign vectors to all possible CPUs"")
> > 
> > is missing a Signed-off-by from its author and committer.
> > 
> > Reverts are commits as well.
> 
> Right, I'm aware.  I staged the tree that made some HP servers finally
> work with the latest linux-block 4.16 changes.  Without thinking about
> the broader implications.  Anyway, I'll drop the revert from
> linux-dm.git's 'for-next'.
> 
> Because I'm confident others will hunt down the irq issues.
> 
> I think Ming was looking to grab the queue mapping info and CPU related
> info from the affected server.

Hi Mike,

I have cooked a fix today, please see the following link:

	https://marc.info/?l=linux-kernel&m=151601867018444&w=2

This issue is clear, and has been described in above link and the
patch. If no objection, I will prepare a formal version.

-- 
Ming
