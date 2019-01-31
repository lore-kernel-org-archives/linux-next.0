From: Qian Cai <cai@lca.pw>
Subject: Re: linux-next: Fixes tags needs some work in the akpm-current tree
Date: Wed, 30 Jan 2019 20:51:42 -0500
Message-ID: <6d110fc4-85b6-cf66-6045-dc81956ffc5c@lca.pw>
References: <20190131110541.3f3a808c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131110541.3f3a808c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liviu Dudau <liviu@dudau.co.uk>
List-Id: linux-next.vger.kernel.org



On 1/30/19 7:05 PM, Stephen Rothwell wrote:
> In commit
> 
>   6e9ed490d190 ("mm/page_owner: fix for deferred struct page init")
> 
> Fixes tag
> 
>   Fixes: fe53ca54270 ("mm: use early_pfn_to_nid in page_ext_init")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 

I think it is better to replace with this version instead,

https://lore.kernel.org/lkml/20190115202812.75820-1-cai@lca.pw/
