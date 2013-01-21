From: Tang Chen <tangchen@cn.fujitsu.com>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Mon, 21 Jan 2013 15:17:06 +0800
Message-ID: <50FCEB72.1040507@cn.fujitsu.com>
References: <20130121170804.8b6eec010e00a6cbbcbad66f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:54635 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751365Ab3AUHRu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jan 2013 02:17:50 -0500
In-Reply-To: <20130121170804.8b6eec010e00a6cbbcbad66f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On 01/21/2013 02:08 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (arm defconfig)
> failed like this:
>
> mm/memblock.c: In function 'memblock_find_in_range_node':
> mm/memblock.c:104:2: error: invalid use of undefined type 'struct movablecore_map'
> mm/memblock.c:123:4: error: invalid use of undefined type 'struct movablecore_map'
> mm/memblock.c:130:7: error: invalid use of undefined type 'struct movablecore_map'
> mm/memblock.c:131:4: error: invalid use of undefined type 'struct movablecore_map'
>
> Caused by commit "page_alloc: bootmem limit with movablecore_map" from
> the akpm tree.  The definition of struct movablecore_map is protected by
> CONFIG_HAVE_MEMBLOCK_NODE_MAP but its use is not.
>
> I have reverted that commit for today.

Thank you very much for reporting this. It was my mistake to miss this 
definition.

I will post a new version of "page_alloc: bootmem limit with 
movablecore_map" since
you have reverted it.


CONFIG_HAVE_MEMBLOCK_NODE_MAP is selected by x86=y, but I don't have any 
non-x86 box.
So I didn't test it. Please tell me if you have any problem with it on 
other platforms.

Thanks. :)
