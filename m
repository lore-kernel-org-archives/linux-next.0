From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-07-13-16-51 uploaded (PSI)
Date: Fri, 13 Jul 2018 18:41:40 -0700
Message-ID: <cf4f5b65-6333-a1f0-6118-16fc0e5bc221@infradead.org>
References: <20180713235138.HoxHd%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713235138.HoxHd%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

On 07/13/2018 04:51 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-07-13-16-51 has been uploaded to
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
> You will need quilt to apply these patches to the latest Linus release (4.x
> or 4.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.


../include/linux/psi.h:12:13: error: conflicting types for 'psi_disabled'
extern bool psi_disabled;


choose one:)

kernel/sched/psi.c:
bool psi_disabled __read_mostly;


include/linux/sched/stat.h:
	extern int psi_disabled;




-- 
~Randy
