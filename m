From: Rik van Riel <riel@redhat.com>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Fri, 25 Apr 2014 07:37:17 -0400
Message-ID: <535A48ED.9000504@redhat.com>
References: <20140424200837.727695A407C@corp2gmr1-2.hot.corp.google.com> <535992DD.3060808@infradead.org> <20140425024924.GR4496@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140425024924.GR4496@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com, Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/24/2014 10:49 PM, Paul E. McKenney wrote:
> On Thu, Apr 24, 2014 at 03:40:29PM -0700, Randy Dunlap wrote:
>> On 04/24/14 13:08, akpm@linux-foundation.org wrote:
>>> The mm-of-the-moment snapshot 2014-04-24-13-07 has been uploaded to
>>>
>>>    http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>>
>>> You will need quilt to apply these patches to the latest Linus release (3.x
>>> or 3.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>>> http://ozlabs.org/~akpm/mmotm/series
>>>
>>
>> uml on x86_64 defconfig:
>>
>> drivers/built-in.o: In function `__handle_sysrq':
>> drivers/tty/sysrq.c:514: undefined reference to `rcu_sysrq_start'
>> drivers/tty/sysrq.c:558: undefined reference to `rcu_sysrq_end'
> 
> Hmmm...  Looks like Rik's patch needs declarations in rcupdate.h.
> Not sure how I missed that...  :-/

There are declarations.  I seem to have misplaced them under some
#ifdef though...

I'll send Andrew a -fix patch, that addresses both this issue and
Jiri's concern.

-- 
All rights reversed
