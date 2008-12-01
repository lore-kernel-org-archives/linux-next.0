From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 1 (etherh network driver)
Date: Mon, 1 Dec 2008 13:27:54 -0800
Message-ID: <20081201132754.9c5055d3.randy.dunlap@oracle.com>
References: <20081201190827.2d02b1a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20081201190827.2d02b1a5.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, shemminger@vyatta.com, rmk@arm.linux.org.uk
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 1 Dec 2008 19:08:27 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20081128:
> 
> Today's tree fails the powerpc allyesconfig build.


Steve (Hemminger),
Please look into this build error:
  http://kisskb.ellerman.id.au/kisskb/buildresult/58438/

It looks like the network driver at drivers/net/arm/etherh.c
is missing the conversion to use netdev_ops.

---
~Randy
