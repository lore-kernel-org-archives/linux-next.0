From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 15:10:34 +1100
Message-ID: <20160108151034.03c9da64@canb.auug.org.au>
References: <20160107195725.3a130b4d@canb.auug.org.au>
	<20160107180244.GR3818@linux.vnet.ibm.com>
	<20160108071932.060a9bcc@canb.auug.org.au>
	<20160107205220.GU3818@linux.vnet.ibm.com>
	<20160108013631.GA11410@fixme-laptop.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37151 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753718AbcAHEKf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 23:10:35 -0500
In-Reply-To: <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>

Hi Boqun,

On Fri, 8 Jan 2016 09:37:04 +0800 Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Mind to check your config options, Stephen?

This was an allyesconfig build, so I assume that
CONFIG_DEBUG_FORCE_WEAK_PER_CPU was set (sorry, I don;t have
the .config file at the moment).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
