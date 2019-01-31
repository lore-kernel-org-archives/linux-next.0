From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Fixes tags needs some work in the akpm-current tree
Date: Thu, 31 Jan 2019 14:57:34 -0800
Message-ID: <20190131145734.80036199beb369d3ceb0123a@linux-foundation.org>
References: <20190131110541.3f3a808c@canb.auug.org.au>
        <6d110fc4-85b6-cf66-6045-dc81956ffc5c@lca.pw>
        <20190131225151.GA3110@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131225151.GA3110@bart.dudau.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Qian Cai <cai@lca.pw>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 31 Jan 2019 22:51:52 +0000 Liviu Dudau <liviu@dudau.co.uk> wrote:

> On Wed, Jan 30, 2019 at 08:51:42PM -0500, Qian Cai wrote:
> > 
> > 
> > On 1/30/19 7:05 PM, Stephen Rothwell wrote:
> > > In commit
> > > 
> > >   6e9ed490d190 ("mm/page_owner: fix for deferred struct page init")
> > > 
> > > Fixes tag
> > > 
> > >   Fixes: fe53ca54270 ("mm: use early_pfn_to_nid in page_ext_init")
> > > 
> > > has these problem(s):
> > > 
> > >   - SHA1 should be at least 12 digits long
> > >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> > >     or later) just making sure it is not set (or set to "auto").
> > > 
> > 
> > I think it is better to replace with this version instead,
> > 
> > https://lore.kernel.org/lkml/20190115202812.75820-1-cai@lca.pw/
> 
> 
> That patch does not look related, afaict.

Confused.

https://lore.kernel.org/lkml/20190115202812.75820-1-cai@lca.pw/
and
https://lore.kernel.org/lkml/20181220203156.43441-1-cai@lca.pw/T/#u

are very much related?

> Andrew, do you want me to re-send the patch with a fixed commit log, or are you OK to
> do some inline editing?

Resend what, exactly?
