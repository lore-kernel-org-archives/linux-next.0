From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: mmotm 2015-04-30-15-43 uploaded
Date: Thu, 30 Apr 2015 22:04:54 -0700
Message-ID: <20150501050454.GA30251@roeck-us.net>
References: <5542b03a.eGilmwPZE40EJM9K%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <5542b03a.eGilmwPZE40EJM9K%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

On Thu, Apr 30, 2015 at 03:44:10PM -0700, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2015-04-30-15-43 has been uploaded to
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
My builders report lots of failures:

mm/bootmem.c: In function 'free_all_bootmem_core':
mm/bootmem.c:237:32: error: 'cur' undeclared (first use in this function)
mm/bootmem.c: In function 'mark_bootmem':
mm/bootmem.c:380:1: warning: control reaches end of non-void function [-Wreturn-type]

Guenter

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
