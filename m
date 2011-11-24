From: Sasha Levin <levinsasha928@gmail.com>
Subject: Re: linux-next: build failure of Linus' tree
Date: Thu, 24 Nov 2011 10:09:05 +0200
Message-ID: <1322122145.4248.2.camel@lappy>
References: <20111124112117.f9abeb7a3f4868be71389372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111124112117.f9abeb7a3f4868be71389372@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thu, 2011-11-24 at 11:21 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> today's linux-next build of Linus' (x86_64_allmodconfig) failed like this:
> 
> drivers/staging/iio/industrialio-core.c: In function 'iio_event_getfd':
> drivers/staging/iio/industrialio-core.c:262:32: error: 'ev_int' undeclared (first use in this function)
> 
> Caused by commit b46413367961 ("iio: fix a leak due to improper use of
> anon_inode_getfd()").
> 
> I have reverted that commit for today.

I've sent a patch yesterday named "iio: Fix build error in
industrialio-core.c" which should fix that.

-- 

Sasha.
