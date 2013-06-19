From: Glauber Costa <glommer@gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the ext4 tree
Date: Thu, 20 Jun 2013 01:08:18 +0400
Message-ID: <20130619210817.GA30417@localhost.localdomain>
References: <20130619172721.00e757acd76e1f9d362f59be@canb.auug.org.au>
 <20130619074402.GC1990@localhost.localdomain>
 <20130619142031.GC24194@thunk.org>
 <20130619100635.72acbd05.akpm@linux-foundation.org>
 <20130619185917.GC24587@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130619185917.GC24587@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Liu <wenqing.lz@taobao.com>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 19, 2013 at 02:59:17PM -0400, Theodore Ts'o wrote:
> On Wed, Jun 19, 2013 at 10:06:35AM -0700, Andrew Morton wrote:
> > 
> > Merge the ext4 change early, please.  The core shrinker changes aren't
> > 100% certain at this time - first they need to stop oopsing ;)
> 
> Ack, sounds like a plan.
> 
> Are they oopsing often enough that they are likely to interfere with
> running regression tests on linux-next?
> 
I have only received one report so far. It will really depend on how likely it
is for other people to hit it - wether or not other people hit it easily is also
good info...
