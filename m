From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for May 13 (avr32 build error due to switchdev
 patch)
Date: Wed, 13 May 2015 17:24:34 -0700
Message-ID: <20150514002434.GA27592@roeck-us.net>
References: <20150513180927.5d2ed45e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150513180927.5d2ed45e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Feldman <sfeldma@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Wed, May 13, 2015 at 06:09:27PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150512:
> 
> New tree: h8300
> 
> The net-next tree gained a conflict against the net tree.
> 
> The security tree gained conflicts against the vfs tree.
> 
> The spi tree lost its build failure.
> 
> The target-updates tree still had its build failure so I used the version
> from next-20150511.
> 
> The gpio tree gained a build failure so I used the version from
> next-20150512.
> 
> Non-merge commits (relative to Linus' tree): 3825
>  3592 files changed, 173394 insertions(+), 76013 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
avr32:defconfig:

net/bridge/br_stp.c: In function 'br_set_state':
net/bridge/br_stp.c:44: error: unknown field 'stp_state' specified in initializer

The problem is most likely that the variable is part of an unnamed union, and
it looks like gcc 4.2.4 doesn't understand that. avr32 is not supported by more
recent versions of gcc, so I can not update the toolchain to work around the
problem.

Introduced by commit 3563606258cf3 ("switchdev: convert STP update to switchdev
attr set").

Guenter
