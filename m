From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 9 (mlx5)
Date: Wed, 9 May 2018 08:31:30 -0700
Message-ID: <826ab15b-f2bc-0c5d-8d5e-6466badcd3e0@infradead.org>
References: <20180509212133.41a59f2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509212133.41a59f2f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Saeed Mahameed <saeedm@mellanox.com>, Matan Barak <matanb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On 05/09/2018 04:21 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180508:
> 

on x86_64:
# CONFIG_SMP is not set

In file included from ../drivers/net/ethernet/mellanox/mlx5/core/main.c:43:0:
../include/linux/mlx5/driver.h: In function 'mlx5_get_vector_affinity_hint':
../include/linux/mlx5/driver.h:1299:13: error: 'struct irq_desc' has no member named 'affinity_hint'
  return desc->affinity_hint;
             ^


-- 
~Randy
