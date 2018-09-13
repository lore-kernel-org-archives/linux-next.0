From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-09-12-16-40 uploaded (psi)
Date: Wed, 12 Sep 2018 17:45:08 -0700
Message-ID: <a9bef471-ac93-2983-618b-ffee65f01e0b@infradead.org>
References: <20180912234039.Xa5RS%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912234039.Xa5RS%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

On 9/12/18 4:40 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-09-12-16-40 has been uploaded to
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

Multiple build errors when CONFIG_SMP is not set: (this is on i386 fwiw)

in the psi (pressure) patches, I guess:

In file included from ../kernel/sched/sched.h:1367:0,
                 from ../kernel/sched/core.c:8:
../kernel/sched/stats.h: In function 'psi_task_tick':
../kernel/sched/stats.h:135:33: error: 'struct rq' has no member named 'cpu'
   psi_memstall_tick(rq->curr, rq->cpu);


-- 
~Randy
