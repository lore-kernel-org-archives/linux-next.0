From: "Nambiar, Amritha" <amritha.nambiar@intel.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 10 Dec 2018 10:38:24 -0800
Message-ID: <35edf438-0a07-83e3-be6d-5989007b683a@intel.com>
References: <20181210123633.4a0e4409@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210123633.4a0e4409@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Or Gerlitz <ogerlitz@mellanox.com>, aul Blakey <paulb@mellanox.com>
List-Id: linux-next.vger.kernel.org

On 12/9/2018 5:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   net/sched/cls_flower.c
> 
> between commit:
> 
>   35cc3cefc4de ("net/sched: cls_flower: Reject duplicated rules also under skip_sw")
> 
> from the net tree and commit:
> 
>   5c72299fba9d ("net: sched: cls_flower: Classify packets using port ranges")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Looks good to me. Thanks!
