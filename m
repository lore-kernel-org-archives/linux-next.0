From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 12 Dec 2017 08:13:10 +0000
Message-ID: <20171212081310.ie5nmwxj25pb7qy4@dell>
References: <20171204141956.5b90bc18@canb.auug.org.au>
 <20171204093953.iwhew4w7wgzm6b3q@dell>
 <20171206103258.4920acde@canb.auug.org.au>
 <20171206085803.d2whwsmua3fm6ij5@dell>
 <20171212131316.02ead60b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171212131316.02ead60b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Feng <rui_feng@realsil.com.cn>, Daniel Bristot de Oliveira <bristot@redhat.com>, Perry Yuan <perry_yuan@dell.com>
List-Id: linux-next.vger.kernel.org

On Tue, 12 Dec 2017, Stephen Rothwell wrote:

> Hi Lee,
> 
> On Wed, 6 Dec 2017 08:58:03 +0000 Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Wed, 06 Dec 2017, Stephen Rothwell wrote:
> > 
> > > On Mon, 4 Dec 2017 09:39:53 +0000 Lee Jones <lee.jones@linaro.org> wrote:  
> > > >  
> > > > > I added the following fix patch:
> > > > > 
> > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Date: Mon, 4 Dec 2017 14:10:34 +1100
> > > > > Subject: [PATCH] misc: rtsx: fix symbol clashes
> > > > > 
> > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>    
> > > > 
> > > > Although I'm not sure how to apply this manually without scissors.  
> > > 
> > > Just take everything from the From: line above to the end and give it
> > > to "git am".  Yes, this may involve saving the email and editting it,
> > > sorry about that.  
> > 
> > If you use the scissors, I can ask Git to deal with all that for me.
> > 
> > We like #lazymaintenance. :D
> 
> So is this going to be applied to the mfd tree?

Que?

Yes, it's in:

  next-20171212 as 51bd7125f740

Also, the pull request for it went out over a week ago:

  https://lkml.org/lkml/2017/12/4/142

What's missing?  Do you still see an issue with the build?

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
