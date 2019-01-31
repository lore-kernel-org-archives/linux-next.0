From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 akpm-current tree
Date: Thu, 31 Jan 2019 13:08:59 -0800
Message-ID: <20190131130859.b4fc9a18405008f08130abb6@linux-foundation.org>
References: <20190131111046.36de09c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131111046.36de09c3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhong jiang <zhongjiang@huawei.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Yang Shi <yang.shi@linux.alibaba.com>, Uladzislau Rezki <urezki@gmail.com>, Shuriyc Chu <sureeju@gmail.com>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On Thu, 31 Jan 2019 11:10:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commits
> 
>   7a738192604a ("mm/page_owner: align with pageblock_nr_pages")
>   ed2205fd9fc0 ("filemap-drop-the-mmap_sem-for-all-blocking-operations-fix")
>   d5b0dce6cd86 ("mm-swap-check-if-swap-backing-device-is-congested-or-not-fix-2")
>   bce20e289b36 ("vmalloc-add-test-driver-to-analyse-vmalloc-allocator-fix")

Yes, they'll all vanish later.

>   e59a90e1c227 ("fs/file.c: initialize init_files.resize_wait")

I've asked Shuriyc to send us a Signed-off-by: for this?

>   8a97a2585bb6 ("checkpatch: don't interpret stack dumps as commit IDs")

a temp for-testing thing from Joe.  I've seen no problems, so perhaps
he can send along a real version?
