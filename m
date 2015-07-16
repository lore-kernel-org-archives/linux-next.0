From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH]
 mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 09:22:49 +1000
Message-ID: <20150717092249.76adc131@canb.auug.org.au>
References: <20150716231405.GA25147@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56978 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751490AbbGPXWv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 19:22:51 -0400
In-Reply-To: <20150716231405.GA25147@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Benjamin LaHaise <bcrl@kvack.org>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Oleg,

On Fri, 17 Jul 2015 01:14:05 +0200 Oleg Nesterov <oleg@redhat.com> wrote:
>
> fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite()
> is not defined in this case. Add yet another "must not be called"
> helper into nommu.c to make the linker happy.
> 
> I still think this is pointless, afaics sys_io_setup() simply can't
> succeed if CONFIG_MMU=n. Instead we should make CONFIG_AIO depend
> on CONFIG_MMU.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Added as a fix to linux-next today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
