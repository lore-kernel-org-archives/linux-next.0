From: Tejun Heo <tj@kernel.org>
Subject: Re: [next-20170609] WARNING: CPU: 3 PID: 71167 at lib/idr.c:157
 idr_replace
Date: Thu, 22 Jun 2017 14:58:37 -0400
Message-ID: <20170622185837.GD18600@htj.duckdns.org>
References: <1497278454.15415.50.camel@abdul.in.ibm.com>
 <20170613135849.GB28327@htj.duckdns.org>
 <149808789548.17054.471609626305557642@mail.alporthouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <149808789548.17054.471609626305557642@mail.alporthouse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <mawilcox@microsoft.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 22, 2017 at 12:31:35AM +0100, Chris Wilson wrote:
> Quoting Tejun Heo (2017-06-13 14:58:49)
> > Cc'ing David Airlie.
> > 
> > This is from drm driver calling in idr_replace() w/ a negative id.
> > Probably a silly bug in error handling path?
> 
> No, this is the validation of an invalid userspace handle. The drm ABI
> for handles is supposed to be a full u32 range with 0 reserved for an
> invalid handle (constrained by the idr_alloc ofc). The WARN was
> introduced by 0a835c4f090a.

Matthew, did idr lost some of its range while being reimplemented
using radix tree?

Thanks.

-- 
tejun
