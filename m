From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: Tree for December 16 (amd64_edac)
Date: Wed, 16 Dec 2009 09:32:45 -0800
Message-ID: <4B2919BD.40001@zytor.com>
References: <20091216183212.118c5e14.sfr@canb.auug.org.au> <20091216092424.5f87214c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762647AbZLPRdF@vger.kernel.org>
In-Reply-To: <20091216092424.5f87214c.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/16/2009 09:24 AM, Randy Dunlap wrote:
> On Wed, 16 Dec 2009 18:32:12 +1100 Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> My usual call for calm: please do not put stuff destined for 2.6.34 into
>> linux-next trees until after 2.6.33-rc1.
>>
>> Changes since 20091215:
> 
> 
> When CONFIG_SMP=n, CONFIG_X86_MSR=m:
> 
> ERROR: "msrs_free" [drivers/edac/amd64_edac_mod.ko] undefined!
> ERROR: "msrs_alloc" [drivers/edac/amd64_edac_mod.ko] undefined!
> 
> 
> Should EDAC_AMD64 also depend on SMP?
> 

That seems absurd... more likely msrs_free/msrs_alloc should not be
SMP-specific, or stubs need to be provided.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
