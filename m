From: Fabio Estevam <festevam@gmail.com>
Subject: Re: mmotm 2014-09-22-16-57 uploaded
Date: Tue, 23 Sep 2014 17:13:29 -0300
Message-ID: <CAOMZO5CdVenLgOFvPXpQB9f1H_ATayDDk5e9Rhrf-32OweqO2w@mail.gmail.com>
References: <5420b8b0.9HdYLyyuTikszzH8%akpm@linux-foundation.org>
	<20140923190222.GA4662@roeck-us.net>
	<20140923130128.79f5931ac03dbb31f53be805@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140923130128.79f5931ac03dbb31f53be805@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, mhocko@suse.cz, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, Sasha Levin <sasha.levin@oracle.com>, Anish Bhatt <anish@chelsio.com>, David Miller <davem@davemloft.net>, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 23, 2014 at 5:01 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:

>> arm:imx_v6_v7_defconfig
>> arm:imx_v4_v5_defconfig
>>
>> drivers/media/platform/coda/coda-bit.c: In function 'coda_fill_bitstream':
>> drivers/media/platform/coda/coda-bit.c:231:4: error: implicit declaration of function 'kmalloc'
>> drivers/media/platform/coda/coda-bit.c: In function 'coda_alloc_framebuffers':
>> drivers/media/platform/coda/coda-bit.c:312:3: error: implicit declaration of function 'kfree'
>
> That's odd - it includes slab.h.  Cc Fabio.

linux-next 20140923 has commit c0aaf696d45e2a72 which included slab.h
and fixed these errors.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
