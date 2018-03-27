From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: linux-next: manual merge of the ipsec tree with the net tree
Date: Tue, 27 Mar 2018 19:23:59 +0200
Message-ID: <20180327192359.4b1bb7d6@epycfail>
References: <20180326091610.148fc62d@canb.auug.org.au>
        <wih7epx8u60.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <wih7epx8u60.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Sender: netdev-owner@vger.kernel.org
To: Petr Machata <petrm@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Steffen Klassert <steffen.klassert@secunet.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 27 Mar 2018 17:33:43 +0300
Petr Machata <petrm@mellanox.com> wrote:

> Hi, this conflict needs to be resolved differently. Below I'm adding a
> patch on top of linux-next. Squash or apply as you see fit.

Petr, thanks for spotting this. Stephen, you can carry these tags for
Petr's patch:

Fixes: adab890d00dc ("Merge remote-tracking branch 'ipsec/master'")
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
Tested-by: Stefano Brivio <sbrivio@redhat.com>

> What's the right way to proceed from here? It looks to me like Stefano
> or Steffen should take this into the ipsec tree (possibly just squash to
> the clamping fix), as they'll hit this conflict the next time they
> rebase on top of net...? Let me know what to do, please.

Steffen, please let me know if you want me to submit anything for the
ipsec tree on top of my previous patches.

I guess another alternative would be that David fixes the conflict the
way Petr solved it, when merging to net?

-- 
Stefano
