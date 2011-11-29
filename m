From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: Tree for Nov 24 (fs/pnfs vs. exofs)
Date: Mon, 28 Nov 2011 16:09:48 -0800
Message-ID: <4ED422CC.60706@panasas.com>
References: <20111124174358.d88f11c0ff700e5e6b3bf73b@canb.auug.org.au> <4ECE91F3.9010007@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4ECE91F3.9010007@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Benny Halevy <bhalevy@tonian.com>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

On 11/24/2011 10:50 AM, Randy Dunlap wrote:
> On 11/23/2011 10:43 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20111123:
> 
> 
> When CONFIG_EXOFS is not enabled:
> 
> fs/built-in.o: In function `objio_alloc_io_state':
> objio_osd.c:(.text+0xcb525): undefined reference to `ore_get_rw_state'
> fs/built-in.o: In function `_write_done':
> objio_osd.c:(.text+0xcb58d): undefined reference to `ore_check_io'
> fs/built-in.o: In function `_read_done':
> objio_osd.c:(.text+0xcb5bf): undefined reference to `ore_check_io'
> fs/built-in.o: In function `objio_alloc_lseg':
> (.text+0xcb9a4): undefined reference to `ore_verify_layout'
> fs/built-in.o: In function `objio_free_result':
> (.text+0xcbb0e): undefined reference to `ore_put_io_state'
> fs/built-in.o: In function `objio_read_pagelist':
> (.text+0xcbc9b): undefined reference to `ore_read'
> fs/built-in.o: In function `objio_write_pagelist':
> (.text+0xcbd4e): undefined reference to `ore_write'
> 
> 
> Full randconfig file is attached.
> 

Thanks Randy. I completely missed that one.

The missing enablement is not CONFIG_EXOFS (that, I tested). It is the
CONFIG_MISC_FILESYSTEMS. Because CONFIG_MISC_FILESYSTEMS is not set then
exofs/Kconfig is not examined and it cannot do it's magic in selecting
everything.

I'm posting a patch as a separate mail reply.

What I did was revert to the old way of forcing all users of the ORE
to select everything that it requires. Instead of the elegant way it
was. The other choice is, of course, to move ore to the lib/ directory
but that one I fear even more. So here ...

Thanks
Boaz
