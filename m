From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 sound-asoc tree
Date: Mon, 10 Nov 2014 14:07:19 +0900
Message-ID: <20141110050719.GA16980@kroah.com>
References: <20141110153132.259d49d9@canb.auug.org.au>
 <20141110043853.GA25797@kroah.com>
 <20141110155142.6c76de7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141110155142.6c76de7b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 10, 2014 at 03:51:42PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 10 Nov 2014 13:38:53 +0900 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Nov 10, 2014 at 03:31:32PM +1100, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next merge of the driver-core tree got a conflict in
> > > sound/soc/intel/sst-haswell-pcm.c between commit 2e4f75919e5a ("ASoC:
> > > Intel: Add PM support to HSW/BDW PCM driver") from the sound-asoc tree
> > > and commit 3c1af8802e45 ("ASoC: intel: drop owner assignment from
> > > platform_drivers") from the driver-core tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary (no action
> > > is required).
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell                    sfr@canb.auug.org.au
> > > 
> > > diff --cc sound/soc/intel/sst-haswell-pcm.c
> > > index 7eb9afc9b33d,ad21e636edc6..000000000000
> > > --- a/sound/soc/intel/sst-haswell-pcm.c
> > > +++ b/sound/soc/intel/sst-haswell-pcm.c
> > > @@@ -1173,9 -899,6 +1173,8 @@@ static const struct dev_pm_ops hsw_pcm_
> > >   static struct platform_driver hsw_pcm_driver = {
> > >   	.driver = {
> > >   		.name = "haswell-pcm-audio",
> > > - 		.owner = THIS_MODULE,
> > >  +		.pm = &hsw_pcm_pm,
> > >  +
> > >   	},
> > >   
> > >   	.probe = hsw_pcm_dev_probe,
> > 
> > 
> > Fix looks good, thanks.
> 
> I assume that there was a good reason not to farm these patches out to
> their respective maintainers?

Yes, It was easier to hit everything in one tree, at one time, so that
is what Wolfram did.  Sorry for the merge conflicts, I didn't think
anyone would be adding .driver attributes to files after they had been
added to the tree.

thanks,

greg k-h
