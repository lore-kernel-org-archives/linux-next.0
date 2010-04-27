From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: April 27 (mm/page-writeback)
Date: Tue, 27 Apr 2010 20:13:32 +0200
Message-ID: <20100427181332.GM27497@kernel.dk>
References: <8ea19b02-d4d8-4000-9842-fec7f5bcf90d@default> <20100427110807.d8641ace.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20100427110807.d8641ace.akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Linux-Next <linux-next@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 27 2010, Andrew Morton wrote:
> On Tue, 27 Apr 2010 09:19:30 -0700 (PDT)
> Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
> > When CONFIG_BLOCK is not enabled:
> > 
> > mm/page-writeback.c:707: error: dereferencing pointer to incomplete type
> > mm/page-writeback.c:708: error: dereferencing pointer to incomplete type
> > 
> 
> Subject: "laptop-mode: Make flushes per-device" fix
> From: Andrew Morton <akpm@linux-foundation.org>
> 
> When CONFIG_BLOCK is not enabled:
> 
> mm/page-writeback.c:707: error: dereferencing pointer to incomplete type
> mm/page-writeback.c:708: error: dereferencing pointer to incomplete type

Thanks Andrew, I've added this to the .35 branch.

-- 
Jens Axboe

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
