From: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: linux-next: Tree for Jan 5 (exofs or nfs ?)
Date: Sun, 8 Jan 2012 10:36:37 +0200
Message-ID: <4F095595.4060309@panasas.com>
References: <20120105191218.42825638a431bc1aba4879de@canb.auug.org.au> <4F0644C1.6000405@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F0644C1.6000405-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, open-osd development <osd-dev-yNzVSZO3znNg9hUCZPvPmw@public.gmane.org>, NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 01/06/2012 02:48 AM, Randy Dunlap wrote:
> On 01/05/2012 12:12 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20120104:
> 
> 
> fs/built-in.o: In function `_write_done':
> objio_osd.c:(.text+0x134971): undefined reference to `ore_check_io'
> fs/built-in.o: In function `_read_done':
> objio_osd.c:(.text+0x134a11): undefined reference to `ore_check_io'
> fs/built-in.o: In function `objio_alloc_io_state':
> objio_osd.c:(.text+0x1353da): undefined reference to `ore_get_rw_state'
> fs/built-in.o: In function `objio_alloc_lseg':
> (.text+0x135724): undefined reference to `ore_verify_layout'
> fs/built-in.o: In function `objio_free_result':
> (.text+0x135966): undefined reference to `ore_put_io_state'
> fs/built-in.o: In function `objio_read_pagelist':
> (.text+0x135be5): undefined reference to `ore_read'
> fs/built-in.o: In function `objio_write_pagelist':
> (.text+0x135d46): undefined reference to `ore_write'
> 
> 
> Full randconfig file is attached.
> 
> 

I have a fix queued for this for linus to pull and Stable@. It should be
in linux-next. Though people reported problems with my git server, im
investigating. Next linux-next should have it.

http://git.open-osd.org/gitweb.cgi?p=linux-open-osd.git;a=commit;h=831c2dc5f47c1dc79c32229d75065ada1dcc66e1

Thanks
Boaz
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
