From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Wed, 10 May 2017 08:19:27 +0200
Message-ID: <20170510061927.GA294@x4>
References: <20170510112411.1e785033@canb.auug.org.au>
 <20170510022054.GA23014@x4>
 <90588794-4b7a-e89b-84aa-db93cfbd9be4@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <90588794-4b7a-e89b-84aa-db93cfbd9be4@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@sandisk.com>
List-Id: linux-next.vger.kernel.org

On 2017.05.09 at 21:00 -0600, Jens Axboe wrote:
> On 05/09/2017 08:20 PM, Markus Trippelsdorf wrote:
> > On 2017.05.10 at 11:24 +1000, Stephen Rothwell wrote:
> >> Hi Jens,
> >>
> >> After merging the block tree, today's linux-next build (arm
> >> multi_v7_defconfig) produced this warning:
> >>
> >> block/elevator.c: In function 'elv_iosched_store':
> >> block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]
> >>   strstrip(elevator_name);
> >>   ^
> >>
> >> Introduced by commit
> >>
> >>   d0f6e2da5871 ("block: Remove leading whitespace and trailing newline in elevator switch error message")
> > 
> > Yes, it was missing a (void) like "(void)strlcpy(...)". But Jens
> > unfortunately removed both warnings, so the following patch should now
> > be enough:
> > 
> > diff --git a/block/elevator.c b/block/elevator.c
> > index fda6be933130..dd0ed19e4fb7 100644
> > --- a/block/elevator.c
> > +++ b/block/elevator.c
> > @@ -1099,8 +1099,7 @@ ssize_t elv_iosched_store(struct request_queue *q, const char *name,
> >  		return count;
> >  
> >  	strlcpy(elevator_name, skip_spaces(name), sizeof(elevator_name));
> > -	strstrip(elevator_name);
> > -	ret = __elevator_change(q, elevator_name);
> > +	ret = __elevator_change(q, strstrip(elevator_name));
> >  	if (!ret)
> >  		return count;
> 
> Care to send that as a proper patch? I don't see that warning here, fwiw.

I don't see it either. But no, I don't want to send a proper patch.
Please just drop my original patch (d0f6e2da5871), because its only
reason was to improve the two debug printks that you have removed later.

-- 
Markus
