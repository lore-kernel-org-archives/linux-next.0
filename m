From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH] EDAC: Document HW_EVENT_ERR_DEFERRED type
Date: Thu, 1 Dec 2016 19:36:45 -0200
Message-ID: <20161201193645.1b5e4f24@vento.lan>
References: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
        <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
        <20161201202741.gb3lkeohdo26fofu@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:59697
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755581AbcLAVgx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2016 16:36:53 -0500
In-Reply-To: <20161201202741.gb3lkeohdo26fofu@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, linux-next@vger.kernel.org

Em Thu, 1 Dec 2016 21:27:42 +0100
Borislav Petkov <bp@suse.de> escreveu:

> On Thu, Dec 01, 2016 at 02:24:53PM -0600, Yazen Ghannam wrote:
> > Add a description of the HW_EVENT_ERR_DEFERRED type that wasn't included
> > with commit d12a969ebbfc ("EDAC, amd64: Add Deferred Error type").

Thanks for the patch!

> > 
> > Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> > Cc: Borislav Petkov <bp@suse.de>
> > Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
> > ---
> >  include/linux/edac.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/include/linux/edac.h b/include/linux/edac.h
> > index cb56dcb..43cd51d 100644
> > --- a/include/linux/edac.h
> > +++ b/include/linux/edac.h
> > @@ -128,6 +128,12 @@ enum dev_type {
> >   *				fatal (maybe it is on an unused memory area,
> >   *				or the memory controller could recover from
> >   *				it for example, by re-trying the operation).
> > + * @HW_EVENT_ERR_DEFERRED:	Deferred Error - Indicates an uncorrectable
> > + *				error whose handling is not urgent. This could
> > + *				be due to hardware data poisoning where the
> > + *				system can continue operation until the poisoned
> > + *				data is consumed. Preemptive measures may also
> > + *				be taken, e.g. offlining pages, etc.

I'm wandering if DEFERRED is the best name here... Maybe it could be
called, instead HW_EVENT_ERR_NON_URGENT or something like that.

Anyway, the description itself looks good.

> >   * @HW_EVENT_ERR_FATAL:		Fatal Error - Uncorrected error that could not
> >   *				be recovered.
> >   */
> > --   
> 
> Acked-by: Borislav Petkov <bp@suse.de>
> 
> Mauro, are you taking this through your tree or should I?

Boris, yeah, I can take care on it. I'll send my pull request
after yours, to avoid any issues.

-- 
Thanks,
Mauro
