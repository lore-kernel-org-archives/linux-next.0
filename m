From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
Date: Thu, 21 Feb 2019 15:36:02 +0200
Message-ID: <CAHp75Vezu6Kbu2OxG90V43EpBWDnZQ5NJbvwhh7MzTd90hH4tQ@mail.gmail.com>
References: <20190207095703.564e76b2@canb.auug.org.au> <38152c55-c2c1-c89f-2751-0ef0d40fcba9@linux.intel.com>
 <CAHp75Vf6gs1342N16MZHvPmiiv3+xJyMyyJQK677KPZbb_7Vrg@mail.gmail.com>
 <e0c40627-f1a2-254f-14b0-b9df0d62dd34@linux.intel.com> <20190221004041.GA5838@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221004041.GA5838@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 21, 2019 at 2:40 AM Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Feb 13, 2019 at 08:45:56PM +0530, Bhardwaj, Rajneesh wrote:
> > On 07-Feb-19 9:25 PM, Andy Shevchenko wrote:
> > > On Thu, Feb 7, 2019 at 4:06 AM Bhardwaj, Rajneesh
> > > <rajneesh.bhardwaj@linux.intel.com> wrote:
> > > > On 07-Feb-19 4:27 AM, Stephen Rothwell wrote:

> > > > In commit
> > > >
> > > >    4284dc008f43 ("platform/x86: intel_pmc_core: Fix file permissions for ltr_show")
> > > >
> > > > Fixes tag
> > > >
> > > >    Fixes: 63cde0c16c67 ("platform/x86: intel_pmc_core: Show Latency Tolerance info")
> > > >
> > > > has these problem(s):
> > > >
> > > >    - Target SHA1 does not exist
> > > >
> > > > Did you mean:
> > > >
> > > >    2eb150558bb7 ("platform/x86: intel_pmc_core: Show Latency Tolerance info")
> > > >
> > > > Yes, upstream commit is 2eb150558bb79ee01c39b64c2868216c0be2904f. For some reason when i do git show on my repo with both these SHA1 i see the same patch.
> > > >
> > > > I will fix this in next version.
> > > Hmm... this came to our published branch, i.e. for-next, would it be
> > > better to update it via rebasing?
> > >
> > > Darren, what do you think?
> >
> > Hi Andy, I have corrected this in v2 anyway and i sent to upstream today,
> > just in case you prefer it over rebasing.
> >
> > https://patchwork.kernel.org/patch/10810123/
> >
>
> While we try hard not to rebase, if the choice is to rebase for-next or send a
> bad commit to upstream, I will opt for the rebase.
>
> Andy, I would suggest doing the rebase.

Okay, I do it right now then,

-- 
With Best Regards,
Andy Shevchenko
