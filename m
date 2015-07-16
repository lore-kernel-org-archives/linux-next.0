From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH]
 mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Thu, 16 Jul 2015 16:24:44 -0700
Message-ID: <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org>
References: <20150716231405.GA25147@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150716231405.GA25147@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Joonsoo Kim <js1304@gmail.com>, Benjamin LaHaise <bcrl@kvack.org>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 17 Jul 2015 01:14:05 +0200 Oleg Nesterov <oleg@redhat.com> wrote:

> fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite()
> is not defined in this case. Add yet another "must not be called"
> helper into nommu.c to make the linker happy.
> 
> I still think this is pointless, afaics sys_io_setup() simply can't
> succeed if CONFIG_MMU=n. Instead we should make CONFIG_AIO depend
> on CONFIG_MMU.
> 
> ..
>
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -2008,6 +2008,12 @@ void filemap_map_pages(struct vm_area_struct *vma, struct vm_fault *vmf)
>  }
>  EXPORT_SYMBOL(filemap_map_pages);
>  
> +int filemap_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
> +{
> +	BUG();
> +	return 0;
> +}
> +
>  static int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
>  		unsigned long addr, void *buf, int len, int write)
>  {

So if anyone starts testing aio on NOMMU, this patch will make the
whole thing immediately go BUG.  This isn't helpful :(

Yes, making AIO depend on MMU sounds better.  Because if it wasn't
busted before, it sure is now!
