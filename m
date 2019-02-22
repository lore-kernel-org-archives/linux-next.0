From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Thu, 21 Feb 2019 17:10:41 -0800
Message-ID: <e21bc598-fe9f-c988-bc8a-bc23b6d62a71@gmail.com>
References: <20190222120644.0bdc4da8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190222120644.0bdc4da8@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On 2/21/19 5:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/net/ethernet/rocker/rocker_main.c: In function 'rocker_port_attr_set':
> drivers/net/ethernet/rocker/rocker_main.c:2083:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    err = rocker_world_port_attr_pre_bridge_flags_set(rocker_port,
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>               attr->u.brport_flags,
>               ~~~~~~~~~~~~~~~~~~~~~
>               trans);
>               ~~~~~~
> drivers/net/ethernet/rocker/rocker_main.c:2086:2: note: here
>   case SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS:
>   ^~~~
> 
> Introduced by commit
> 
>   93700458ff63 ("rocker: Check Handle PORT_PRE_BRIDGE_FLAGS")
> 
> I get this warning because I am building with -Wimplicit-fallthrough
> in attempt to catch new additions early.  The gcc warning can be turned
> off by adding a /* fall through */ comment at the point the fall through
> happens (assuming that the fall through is intentional).

There is a missing break, my rebase went wrong with that, I will send a
fix shortly for that.
-- 
Florian
