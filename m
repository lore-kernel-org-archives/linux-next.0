From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: Next March 25: staging/epl build break.
Date: Wed, 25 Mar 2009 09:04:00 -0700
Message-ID: <49CA55F0.9030203@oracle.com>
References: <20090325191229.0e17eaf6.sfr@canb.auug.org.au> <49CA18D9.6080302@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <49CA18D9.6080302@in.ibm.com>
Sender: netdev-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, netdev@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Sachin Sant wrote:
> Today's next x86 randconfig build failed with
> 
> drivers/staging/epl/VirtualEthernetLinux.c: In function VEthAddInstance:
> drivers/staging/epl/VirtualEthernetLinux.c:302: error: struct net_device
> has no member named open
> drivers/staging/epl/VirtualEthernetLinux.c:303: error: struct net_device
> has no member named stop
> drivers/staging/epl/VirtualEthernetLinux.c:304: error: struct net_device
> has no member named get_stats
> drivers/staging/epl/VirtualEthernetLinux.c:305: error: struct net_device
> has no member named hard_start_xmit
> drivers/staging/epl/VirtualEthernetLinux.c:306: error: struct net_device
> has no member named tx_timeout


There are lots of build errors similar to this, in appletalk, irda,
tokenring, etc etc...


-- 
~Randy
