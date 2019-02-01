From: Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: linux-next: Fixes tags needs some work in the akpm-current tree
Date: Fri, 1 Feb 2019 00:18:26 +0000
Message-ID: <20190201001825.GB3110@bart.dudau.co.uk>
References: <20190131110541.3f3a808c@canb.auug.org.au>
 <6d110fc4-85b6-cf66-6045-dc81956ffc5c@lca.pw>
 <20190131225151.GA3110@bart.dudau.co.uk>
 <20190131145734.80036199beb369d3ceb0123a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190131145734.80036199beb369d3ceb0123a@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Qian Cai <cai@lca.pw>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 31, 2019 at 02:57:34PM -0800, Andrew Morton wrote:
> On Thu, 31 Jan 2019 22:51:52 +0000 Liviu Dudau <liviu@dudau.co.uk> wrote:
> 
> > On Wed, Jan 30, 2019 at 08:51:42PM -0500, Qian Cai wrote:
> > > 
> > > 
> > > On 1/30/19 7:05 PM, Stephen Rothwell wrote:
> > > > In commit
> > > > 
> > > >   6e9ed490d190 ("mm/page_owner: fix for deferred struct page init")
> > > > 
> > > > Fixes tag
> > > > 
> > > >   Fixes: fe53ca54270 ("mm: use early_pfn_to_nid in page_ext_init")
> > > > 
> > > > has these problem(s):
> > > > 
> > > >   - SHA1 should be at least 12 digits long
> > > >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> > > >     or later) just making sure it is not set (or set to "auto").
> > > > 
> > > 
> > > I think it is better to replace with this version instead,
> > > 
> > > https://lore.kernel.org/lkml/20190115202812.75820-1-cai@lca.pw/
> > 
> > 
> > That patch does not look related, afaict.
> 
> Confused.
> 
> https://lore.kernel.org/lkml/20190115202812.75820-1-cai@lca.pw/
> and
> https://lore.kernel.org/lkml/20181220203156.43441-1-cai@lca.pw/T/#u
> 
> are very much related?

My bad, I've read the top of the message that was talking about my commit splitting the
Fixes: commit title into multiple lines and assumed that was the only issue reported.


> 
> > Andrew, do you want me to re-send the patch with a fixed commit log, or are you OK to
> > do some inline editing?
> 
> Resend what, exactly?

Content of commit 86c7502b25ed so that the title of the commit it fixes does not spill
over into the next line.

Best regards,
Liviu


-- 
           ________________________________________________________
  ________|                                                        |_______
  \       |  With enough courage, you can do without a reputation  |      /
   \      |                                  -- Rhett Butler       |     /
   /      |________________________________________________________|     \
  /__________)                                                  (_________\
