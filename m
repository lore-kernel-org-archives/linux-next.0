From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-11-20-16-13 uploaded (arch/um/kernel/sysrq.c)
Date: Wed, 20 Nov 2013 16:52:05 -0800
Message-ID: <528D5935.6070907@infradead.org>
References: <20131121001408.17DC85A41C6@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20131121001408.17DC85A41C6@corp2gmr1-2.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Richard Weinberger <richard@nod.at>, user-mode-linux-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

On 11/20/13 16:14, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-11-20-16-13 has been uploaded to
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

on i386:
(with um i386 defconfig)

arch/um/kernel/sysrq.c:22:13: error: expected identifier or '(' before 'do'
um/kernel/sysrq.c:22:13: error: expected identifier or '(' before 'while'


so sysrq.c is picking up <linux/stacktrace.h> somehow and not liking it.


-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
