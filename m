From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: linux-next: build warning after merge of the regulator tree
Date: Tue, 2 Oct 2018 09:43:17 +0300
Message-ID: <20181002064317.GD9389@localhost.localdomain>
References: <20181002130748.61e33ad1@canb.auug.org.au>
 <20181002061644.GC9389@localhost.localdomain>
 <20181002162551.29b8c977@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181002162551.29b8c977@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hello Stephen, Mark & All,

On Tue, Oct 02, 2018 at 04:25:51PM +1000, Stephen Rothwell wrote:
> On Tue, 2 Oct 2018 09:16:44 +0300 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com> wrote:
> >
> > On Tue, Oct 02, 2018 at 01:07:48PM +1000, Stephen Rothwell wrote:
> > > After merging the regulator tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > > 
> > > drivers/mfd/rohm-bd718x7.c: In function 'bd718xx_i2c_probe':
> > > drivers/mfd/rohm-bd718x7.c:101:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > >   bd718xx->chip_type = (unsigned int)  
> > 
> > I am pretty sure the last patch version corrected this to
> > +       bd71837->chip_type = (unsigned int)(uintptr_t)
> > +                               of_device_get_match_data(&i2c->dev);
> > 
> > is it possible one of the earlier versions has accidentally been
> > applied? Should I create patch on top of the last regulator tree or what
> > is the simplest way fix this?
> 
> Sorry, this came from commit
> 
>   dd2be639f4a9 ("regulator/mfd: bd718xx: rename bd71837/bd71847 common instances")
> 
> which is later than the commit I noted.  In this later commit, this happens:
> 
> -	bd71837->chip_irq = i2c->irq;
> -	bd71837->chip_type = (unsigned int)(uintptr_t)
> +	bd718xx->chip_irq = i2c->irq;
> +	bd718xx->chip_type = (unsigned int)
>  				of_device_get_match_data(&i2c->dev);

Right. So looks like I am still the guilty one then. I've overwritten
the fix in this rename patch which followed the corrected initial
support patch. I guess sending incremental patch with fix to regulator
tree is correct way to go, right? I'll prepare one against Mark's branch
"origin/topic/bd718xx". Mark, please let me know if you want me to send
it or if I should do it on top of some other branch.

Br,
	Matti Vaittinen
