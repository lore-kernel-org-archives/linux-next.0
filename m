From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 12 Feb 2019 16:58:04 -0800
Message-ID: <e61383a7-012e-1c47-82c1-dbe4b982e0bc@gmail.com>
References: <20190213115141.376058e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213115141.376058e8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Le 2/12/19 à 4:51 PM, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/staging/fsl-dpaa2/ethsw/ethsw.c: In function 'swdev_port_attr_get':
> drivers/staging/fsl-dpaa2/ethsw/ethsw.c:646:26: warning: unused variable 'port_priv' [-Wunused-variable]
>   struct ethsw_port_priv *port_priv = netdev_priv(netdev);
>                           ^~~~~~~~~
> 
> Introduced by commit
> 
>   1b8b589d9103 ("staging: fsl-dpaa2: ethsw: Remove getting PORT_BRIDGE_FLAGS")
> 

Also fixed with:

http://patchwork.ozlabs.org/project/netdev/list/?series=91603
-- 
Florian
