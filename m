From: "Valentin, Eduardo" <eduardo.valentin@ti.com>
Subject: Re: linux-next: manual merge of the staging tree with the thermal tree
Date: Tue, 25 Sep 2012 18:20:46 +0300
Message-ID: <CAGF5oy_4W0smcW=-QthK6Xr1i3e6+kQz+_Tc2qUPqGROfhvhDA@mail.gmail.com>
References: <20120925161355.06cfe875c78bc163b050ed8c@canb.auug.org.au>
	<20120925151103.GB18777@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120925151103.GB18777@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Durgadoss R <durgadoss.r@intel.com>, Zhang Rui <rui.zhang@intel.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Tue, Sep 25, 2012 at 6:11 PM, Greg KH <greg@kroah.com> wrote:
>
> On Tue, Sep 25, 2012 at 04:13:55PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > Today's linux-next merge of the staging tree got a conflict in
> > drivers/staging/omap-thermal/omap-thermal-common.c between commit
> > 82d3a76a88cd ("Thermal: Pass zone parameters as argument to
> > tzd_register") from the thermal tree and commit 765a1939a364 ("staging:
> > omap-thermal: fix polling period settings") from the staging tree.
> >
> > I just used the thermal tree version and can carry the fix as necessary
> > (no action is required).
>
> That sounds correct to me, thanks.


Sounds good to me as well.

>
> greg k-h




--

Eduardo Valentin
