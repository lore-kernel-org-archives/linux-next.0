From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 13:31:33 -0700
Message-ID: <20150727133133.a2c22062fba70b971f449d0a@linux-foundation.org>
References: <20150724153334.543cfc7b@canb.auug.org.au>
	<1437768965.3298.52.camel@stgolabs.net>
	<20150724230902.GQ3717@linux.vnet.ibm.com>
	<20150725194739.GA9753@x>
	<1437859442.3298.68.camel@stgolabs.net>
	<20150725223524.GA14593@x>
	<20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
	<20150727202758.GA28119@cloud>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150727202758.GA28119@cloud>
Sender: linux-kernel-owner@vger.kernel.org
To: josh@joshtriplett.org
Cc: Davidlohr Bueso <dave@stgolabs.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 27 Jul 2015 13:27:58 -0700 josh@joshtriplett.org wrote:

> I agree with that.  I'm wondering if, rather than making the
> SRCU-ification optional, shrinkers themselves could just be optional.
> Unless I'm badly misunderstanding what shrinkers do, they seem like a
> perfect example of something that could be omitted with little to no
> impact.  (Stub them out, make them never called, and if you run out of
> memory just be unhappy.  Ditto for the oom-killer, which really ought to
> be optional.)

The shrinkers do important stuff ;) "find /" will consume large amounts
of memory for inode and dentry caches.  The shrinkers are how we free
that up again.
