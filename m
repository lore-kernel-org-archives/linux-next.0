From: Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the edac tree
Date: Thu, 1 Dec 2016 14:57:54 -0500
Message-ID: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
References: <20161128143726.7fda1849@canb.auug.org.au>
 <20161128082734.bdl4dhothemm7ja5@pd.tnic>
 <20161130085013.4798b4a7@vento.lan>
 <20161201104846.kjvuy5tj475oxzke@pd.tnic>
 <20161201100617.511d8aae@vento.lan>
 <20161201160203.hhm6w3iyrnvcukzu@yaz-fedora.dyhomenet>
 <20161201181501.eynw6ucx6cdsg6hl@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161201181501.eynw6ucx6cdsg6hl@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Dec 01, 2016 at 07:15:01PM +0100, Borislav Petkov wrote:
> On Thu, Dec 01, 2016 at 11:02:04AM -0500, Yazen Ghannam wrote:
> > A deferred error is an uncorrectable error whose handling can be
> > deferred, i.e. it's not urgent. This affects the system behavior, but
> > I'm now thinking that this shouldn't affect users' behavior. I think it
> > would be simpler to just classify deferred errors as uncorrectable
> > errors so that users treat them as such.
> 
> Why would we want to lie about deferred errors being uncorrectable?
>

They are uncorrectable errors that can be handled differently. If you
can't handle them then there's not much difference.
 
> And I believe deferred errors can be handled differently like freeze the
> process using the page instead of killing it. And so on...
> 

If deferred errors can be handled differently in userspace, then you're
right we should maintain the distinction. I was thinking we'd only
handle them in the kernel.

> Why aren't you simply adding the documentation about
> HW_EVENT_ERR_DEFERRED and be done with it? The downstream path like
> tracepoint and all can handle all that just fine.
> 

Okay, will do.

> > Boris,
> > Can we drop or revert commit d12a969ebbfc?
> 
> No can do. It is a public branch and there's no touching it.
> 

Okay, got it.

Thanks,
Yazen
