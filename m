From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Tree for Sep 25
Date: Wed, 25 Sep 2013 17:47:28 -0700
Message-ID: <1380156448.17366.44.camel@joe-AO722>
References: <20130925144329.7d240a6fa2b5782dc8726340@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130925144329.7d240a6fa2b5782dc8726340@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2013-09-25 at 14:43 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Heads up: I will be having a 3 week break leading up to the kernel
> summit.  This means that next-20130927 (next Friday) will be the last
> linux-next release until next-20131028 (or maybe 29).  I presume that
> Linus will be up to v3.12-rc7 by then and -rc7 is often the last before
> a release ... Please plan accordingly.

Hi Stephen.

Maybe this is a good time for an experiment.

Perhaps it would be interesting if you still had a script
running every workday and pushed out the result tree without
trying to do any patch conflict resolution yourself.

Maybe notify the owners of the trees that conflict and let
them work out whatever resolutions that are necessary.

I think FengGuang's robot can supply most all the details
necessary and maybe you can do a lot less work in the future.
