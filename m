From: Eric Ren <zren@suse.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 13 Jan 2017 14:01:53 +0800
Message-ID: <491beed5-769c-3c7d-67ba-10e4a55eff75@suse.com>
References: <20170112144933.7f161c69@canb.auug.org.au>
 <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
 <20170113144212.5d46dcc6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170113144212.5d46dcc6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On 01/13/2017 11:42 AM, Stephen Rothwell wrote:
> Hi Eric,
>
> On Thu, 12 Jan 2017 13:06:01 +0800 Eric Ren <zren@suse.com> wrote:
>> Thanks for your report and the fix for it. The 0-day project has reported several days ago,
>> but this patch set is still in discussion, so I am waiting for more days to see if  other
>> developers
>> have any other questions.
>>
>> I am confused that how to deal with your patch if I need to work out the V2 patch set. Perhaps,
>> pick up your fix and  add your efforts in the change log?
> If you had already fixed the problem, then just submit your new
> version.  You only need to give credit when you use someone's work.
>
> If you want to give credit, then maybe a line like:
>
> [sfr@canb.auug.org.au remove some inlines]
>
> among the Signed-off-by: lines
Sure! I always keep it in mind;-)

Thanks,
Eric
