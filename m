From: Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: mmotm 2015-01-22-15-04: qemu failure due to 'mm: memcontrol:
 remove unnecessary soft limit tree node test'
Date: Fri, 23 Jan 2015 11:02:04 -0500
Message-ID: <20150123160204.GA32592@phnom.home.cmpxchg.org>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org>
 <20150123050802.GB22751@roeck-us.net>
 <20150123141817.GA22926@phnom.home.cmpxchg.org>
 <alpine.DEB.2.11.1501230908560.15325@gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1501230908560.15325@gentwo.org>
Sender: owner-linux-mm@kvack.org
To: Christoph Lameter <cl@linux.com>
Cc: Guenter Roeck <linux@roeck-us.net>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

On Fri, Jan 23, 2015 at 09:17:44AM -0600, Christoph Lameter wrote:
> On Fri, 23 Jan 2015, Johannes Weiner wrote:
> 
> > Is the assumption of this patch wrong?  Does the specified node have
> > to be online for the fallback to work?
> 
> Nodes that are offline have no control structures allocated and thus
> allocations will likely segfault when the address of the controls
> structure for the node is accessed.
> 
> If we wanted to prevent that then every allocation would have to add a
> check to see if the nodes are online which would impact performance.

Okay, that makes sense, thank you.

Andrew, can you please drop this patch?

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
