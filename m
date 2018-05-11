From: Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the net tree
Date: Fri, 11 May 2018 09:30:03 +0800
Message-ID: <20180511013003.GG8958@leo.usersys.redhat.com>
References: <20180511071716.038a9095@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180511071716.038a9095@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 11, 2018 at 07:17:16AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   0e8411e426e2 ("ipv4: reset fnhe_mtu_locked after cache route flushed")
> 
> is missing a Signed-off-by from its author.

Opps, My bad.

> After route cache is flushed via ipv4_sysctl_rtcache_flush(), we forget
> to reset fnhe_mtu_locked in rt_bind_exception(). When pmtu is updated
> in __ip_rt_update_pmtu(), it will return directly since the pmtu is
> still locked. e.g.
>
> + ip netns exec client ping 10.10.1.1 -c 1 -s 1400 -M do
> PING 10.10.1.1 (10.10.1.1) 1400(1428) bytes of data.
> From 10.10.0.254 icmp_seq=1 Frag needed and DF set (mtu = 0)
>
> --- 10.10.1.1 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms

I shouldn't add comments with the '---' lines. David reminded me before. But
I didn't realise it when pasted the ping logs. Another lesson learned...

Thanks Stephen.

Regards
Hangbin
