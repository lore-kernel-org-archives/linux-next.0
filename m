From: Dave Jiang <dave.jiang@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the xarray tree
Date: Wed, 25 Jul 2018 17:08:12 -0700
Message-ID: <6ec67183-2bf0-5843-2642-609403bcca17@intel.com>
References: <20180726072814.6c93b595@canb.auug.org.au>
 <20180725233621.GA20272@bombadil.infradead.org>
 <20180726100352.2d7c9c21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726100352.2d7c9c21@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org



On 07/25/2018 05:03 PM, Stephen Rothwell wrote:
> Hi Matthew,
> 
> On Wed, 25 Jul 2018 16:36:21 -0700 Matthew Wilcox <willy@infradead.org> wrote:
>>
>> On Thu, Jul 26, 2018 at 07:28:14AM +1000, Stephen Rothwell wrote:
>>>
>>> Commits
>>>
>>>   890e537e2b42 ("filesystem-dax: Introduce dax_lock_mapping_entry()")
>>>   aaf149902c79 ("filesystem-dax: Set page->index")
>>>
>>> are missing a Signed-off-by from their committers.  
>>
>> Oh, hah.  I assume this is an automated email?
> 
> Well, semi-automatic :-)
> 
>> These two commits I cherry-picked from the nvdimm tree so that XArray can
>> be rebased on top of it.  Is there some other way I should be doing this,
>> like rebasing on top of the nvdimm tree?
> 
> Ideally, the nvdimm tree would have just those two commits in a branch
> that you could merge (so that you both have the same commits (as
> opposed to patches)) that way these changes cannot cause conflicts when
> the files are further modifed in either tree.  Alternatively, if you do
> have to cherry-pick them, then you need to add your Signed-off-by to
> the copy that you commit.
> 
> As things are now, you could merge commit
> 
>   c2a7d2a11552 ("filesystem-dax: Introduce dax_lock_mapping_entry()")
> 
> from the nvdimm tree into your tree before the conflicting commits in
> your tree (or just rebase your tree on top of that commit).  You need
> to make sure that Dan and/or Dave (cc'd) will never rebase that part of
> their tree.  Also, you will pick up some other commits (which may not
> be a problem for you).
> 

I have all the acks I need for that branch for Dan's patches. So that
branch shouldn't change anymore AFAIK.
