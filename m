From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [next-20170609] WARNING: CPU: 3 PID: 71167 at lib/idr.c:157 idr_replace
Date: Thu, 22 Jun 2017 00:31:35 +0100
Message-ID: <149808789548.17054.471609626305557642@mail.alporthouse.com>
References: <1497278454.15415.50.camel@abdul.in.ibm.com>
 <20170613135849.GB28327@htj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613135849.GB28327@htj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, David Airlie <airlied@linux.ie>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Quoting Tejun Heo (2017-06-13 14:58:49)
> Cc'ing David Airlie.
> 
> This is from drm driver calling in idr_replace() w/ a negative id.
> Probably a silly bug in error handling path?

No, this is the validation of an invalid userspace handle. The drm ABI
for handles is supposed to be a full u32 range with 0 reserved for an
invalid handle (constrained by the idr_alloc ofc). The WARN was
introduced by 0a835c4f090a.
-Chris
