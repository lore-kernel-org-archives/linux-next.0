From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Thu, 24 Apr 2014 15:40:29 -0700
Message-ID: <535992DD.3060808@infradead.org>
References: <20140424200837.727695A407C@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140424200837.727695A407C@corp2gmr1-2.hot.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On 04/24/14 13:08, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-04-24-13-07 has been uploaded to
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

uml on x86_64 defconfig:

drivers/built-in.o: In function `__handle_sysrq':
drivers/tty/sysrq.c:514: undefined reference to `rcu_sysrq_start'
drivers/tty/sysrq.c:558: undefined reference to `rcu_sysrq_end'


-- 
~Randy
