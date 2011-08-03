From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH -next] kvm: uses TASKSTATS, depends on NET
Date: Wed, 3 Aug 2011 18:02:19 -0300
Message-ID: <20110803210218.GC31923@amt.cnet>
References: <20110802155727.a3d76babdd2c6fd5d33928c5@canb.auug.org.au>
 <20110802125431.e1902bd1.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110802125431.e1902bd1.rdunlap@xenotime.net>
Sender: kvm-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Aug 02, 2011 at 12:54:31PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> CONFIG_TASKSTATS just had a change to use netlink, including
> a change to "depends on NET".  Since "select" does not follow
> dependencies, KVM also needs to depend on NET to prevent build
> errors when CONFIG_NET is not enabled.
> 
> Sample of the reported "undefined reference" build errors:
> 
> taskstats.c:(.text+0x8f686): undefined reference to `nla_put'
> taskstats.c:(.text+0x8f721): undefined reference to `nla_reserve'
> taskstats.c:(.text+0x8f8fb): undefined reference to `init_net'
> taskstats.c:(.text+0x8f905): undefined reference to `netlink_unicast'
> taskstats.c:(.text+0x8f934): undefined reference to `kfree_skb'
> taskstats.c:(.text+0x8f9e9): undefined reference to `skb_clone'
> taskstats.c:(.text+0x90060): undefined reference to `__alloc_skb'
> taskstats.c:(.text+0x901e9): undefined reference to `skb_put'
> taskstats.c:(.init.text+0x4665): undefined reference to `genl_register_family'
> taskstats.c:(.init.text+0x4699): undefined reference to `genl_register_ops'
> taskstats.c:(.init.text+0x4710): undefined reference to `genl_unregister_ops'
> taskstats.c:(.init.text+0x471c): undefined reference to `genl_unregister_family'
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

Applied, thanks.

