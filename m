From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 7 (net/xdp)
Date: Mon, 7 May 2018 09:17:42 -0700
Message-ID: <e9890e95-16b4-4540-301b-43f17a824808@infradead.org>
References: <20180507153147.166ee38a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507153147.166ee38a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>
List-Id: linux-next.vger.kernel.org

On 05/06/2018 10:31 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180504:
> 

on i386:

net/xdp/xdp_umem.o: In function `xdp_umem_reg':
xdp_umem.c:(.text+0x47e): undefined reference to `__udivdi3'


-- 
~Randy
