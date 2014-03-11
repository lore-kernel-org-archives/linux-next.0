From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-03-10-15-35 uploaded (virtio_balloon)
Date: Tue, 11 Mar 2014 10:12:18 -0700
Message-ID: <531F43F2.1030504@infradead.org>
References: <20140310223701.0969C31C2AA@corp2gmr1-1.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140310223701.0969C31C2AA@corp2gmr1-1.hot.corp.google.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
List-Id: linux-next.vger.kernel.org

On 03/10/2014 03:37 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-03-10-15-35 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 
> You will need quilt to apply these patches to the latest Linus release (3.x
> or 3.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.
> 
> This tree is partially included in linux-next.  To see which patches are
> included in linux-next, consult the `series' file.  Only the patches
> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
> linux-next.
> 

on x86_64:

ERROR: "balloon_devinfo_alloc" [drivers/virtio/virtio_balloon.ko] undefined!
ERROR: "balloon_page_enqueue" [drivers/virtio/virtio_balloon.ko] undefined!
ERROR: "balloon_page_dequeue" [drivers/virtio/virtio_balloon.ko] undefined!

when loadable module

or

virtio_balloon.c:(.text+0x1fa26): undefined reference to `balloon_page_enqueue'
virtio_balloon.c:(.text+0x1fb87): undefined reference to `balloon_page_dequeue'
virtio_balloon.c:(.text+0x1fdf1): undefined reference to `balloon_devinfo_alloc'

when builtin.


-- 
~Randy
