From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH 2/2] don't compile SGI XP/GRU on ia64_generic
Date: Tue, 10 Feb 2009 21:54:51 +0900 (JST)
Message-ID: <20090210215338.700A.KOSAKI.MOTOHIRO@jp.fujitsu.com>
References: <20090210210110.7001.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090210125157.GT8577@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20090210125157.GT8577@sgi.com>
Sender: linux-ia64-owner@vger.kernel.org
To: Robin Holt <holt@sgi.com>
Cc: kosaki.motohiro@jp.fujitsu.com, Jack Steiner <steiner@sgi.com>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Dean Nelson <dcn@sgi.com>
List-Id: linux-next.vger.kernel.org

> Dean Nelson submitted a patch yesterday to make this work.
> 
> Robin

Thanks!
I'm happy a lot.


> 
> 
> On Tue, Feb 10, 2009 at 09:03:40PM +0900, KOSAKI Motohiro wrote:
> > Subject: [PATCH] ia64: don't compile SGI-XP on ia64 generic.
> > Impact: fix build error
> > 
> > Currently sgi-xp driver depend on "uv.h" header file.
> > but only x86 have "uv.h" header.
> > 
> > Then, ia64 hit following build error.



