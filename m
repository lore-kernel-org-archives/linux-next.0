From: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 30 Jul 2015 10:06:28 +0200
Message-ID: <55B9DB04.4050702@cumulusnetworks.com>
References: <20150730121025.3703e788@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20150730121025.3703e788@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Satish Ashok <sashok@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

On 07/30/2015 04:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   net/bridge/br_multicast.c
> 
> between commit:
> 
>   544586f742b4 ("bridge: mcast: give fast leave precedence over multicast router and querier")
> 
> from the net tree and commit:
> 
>   09cf0211f970 ("bridge: mdb: fill state in br_mdb_notify")
> 
> from the net-next tree.
> 
> I fixed it up (hopefully - see below) and can carry the fix as necessary
> (no action is required).
> 

Right, looks good. Thank you!
