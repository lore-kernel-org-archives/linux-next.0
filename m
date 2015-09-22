From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Mon, 21 Sep 2015 18:17:34 -0700
Message-ID: <5600AC2E.8050701@roeck-us.net>
References: <55FAEA67.9000102@roeck-us.net>
 <20150918142507.GA30125@node.dhcp.inet.fi> <20150918145309.GG32685@axis.com>
 <55FC2A1F.8050207@roeck-us.net> <20150921153435.CE98C138@black.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150921153435.CE98C138@black.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com
List-Id: linux-next.vger.kernel.org

On 09/21/2015 08:34 AM, Kirill A. Shutemov wrote:
> Guenter Roeck wrote:
>> On 09/18/2015 07:53 AM, Jesper Nilsson wrote:
>>> On Fri, Sep 18, 2015 at 05:25:07PM +0300, Kirill A. Shutemov wrote:
>>>> On Thu, Sep 17, 2015 at 09:29:27AM -0700, Guenter Roeck wrote:
>>>>> Hi,
>>>>>
>>>>> my crisv32 qemu test fails with next-20150917 as follows.
>>>>>
>>>>> NET: Registered protocol family 16
>>>>> kernel BUG at mm/slab.c:1648!
>>>>> Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
>>>>> Oops: 0000
>>>>>
>>>>> [ register dump follows ]
>>>>>
>>>>> See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/83/steps/qemubuildcommand/logs/stdio
>>>>> for a complete log.
>>>>
>>>> Is there a chance to get proper backtrace?
>>>
>>> Yes, it should be possible with CONFIG_KALLSYMS=y in the kconfig.
>>>
>>
>> Good to know. I added it to my configuration.
>>
>> Here it is:
>>
>> kernel BUG at mm/slab.c:1648!
>
> I still don't understand what's going on :(
> Could you try with this instrumentation:
>
> diff --git a/mm/slab.c b/mm/slab.c
> index ce9c6531e6f7..10035d1a06d3 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -1645,7 +1645,11 @@ static void kmem_freepages(struct kmem_cache *cachep, struct page *page)
>                  sub_zone_page_state(page_zone(page),
>                                  NR_SLAB_UNRECLAIMABLE, nr_freed);
>
> -       BUG_ON(!PageSlab(page));
> +       if (!PageSlab(page)) {
> +               dump_page(page, "page");
> +               dump_page(compound_head(page), "compound_head(page)");
> +               BUG();
> +       }
>          __ClearPageSlabPfmemalloc(page);
>          __ClearPageSlab(page);
>          page_mapcount_reset(page);
>

page:c04a5340 count:1 mapcount:1 mapping:c1f34080 index:0xc1f34060
flags: 0x80(slab)
page dumped because: page
page:c1f17a04 count:0 mapcount:1 mapping:00d13600 index:0xc0
flags: 0x0()
page dumped because: compound_head(page)

Does that help ?

Guenter
