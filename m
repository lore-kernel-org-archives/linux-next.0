From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 12 Feb 2019 16:57:51 -0800
Message-ID: <ebfab3db-4fa3-23fe-ace6-a7fe03858190@gmail.com>
References: <20190213114916.1a83a363@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213114916.1a83a363@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Le 2/12/19 à 4:49 PM, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c: In function 'mlxsw_sp_port_attr_get':
> drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:438:19: warning: unused variable 'mlxsw_sp' [-Wunused-variable]
>   struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port->mlxsw_sp;
>                    ^~~~~~~~
> 
> Introduced by commit
> 
>   1ecb195753a1 ("mlxsw: spectrum_switchdev: Remove getting PORT_BRIDGE_FLAGS")

Fixed with:

http://patchwork.ozlabs.org/project/netdev/list/?series=91603
-- 
Florian
