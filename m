From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the net tree with the net-current
	tree
Date: Wed, 23 Jun 2010 14:14:33 +1000
Message-ID: <20100623041433.GB30067@gondor.apana.org.au>
References: <20100623125116.1370bdd4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100623125116.1370bdd4.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Changli Gao <xiaosuo@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 23, 2010 at 12:51:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net tree got a conflict in
> net/ipv4/ip_output.c between commit
> 26cde9f7e2747b6d254b704594eed87ab959afa5 ("udp: Fix bogus UFO packet
> generation") from the net-current tree and commit
> d8d1f30b95a635dbd610dcc5eb641aca8f4768cf ("net-next: remove useless union
> keyword") from the net tree.
> 
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

Looks good to me.

Thanks,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
