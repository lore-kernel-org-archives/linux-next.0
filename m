From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-06-27-16-36 uploaded (wait event common)
Date: Thu, 27 Jun 2013 22:30:41 -0700
Message-ID: <51CD1F81.4040202@infradead.org>
References: <20130627233733.BAEB131C3BE@corp2gmr1-1.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20130627233733.BAEB131C3BE@corp2gmr1-1.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
List-Id: linux-next.vger.kernel.org

On 06/27/13 16:37, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-06-27-16-36 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 

My builds are littered with hundreds of warnings like this one:

drivers/tty/tty_ioctl.c:220:6: warning: the omitted middle operand in ?: will always be 'true', suggest explicit middle operand [-Wparentheses]

I guess due to this line from wait_event_common():

+		__ret = __wait_no_timeout(tout) ?: (tout) ?: 1;



-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
