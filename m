From: Shreyas Bhatewara <sbhatewara@vmware.com>
Subject: RE: linux-next: net tree build failure
Date: Thu, 19 Nov 2009 02:51:55 -0800
Message-ID: <89E2752CFA8EC044846EB8499819134101737DBD7C@EXCH-MBX-4.vmware.com>
References: <20091118165145.d0c3114b.sfr@canb.auug.org.au>,<20091117.230530.108140449.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754424AbZKSKx2@vger.kernel.org>
In-Reply-To: <20091117.230530.108140449.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

________________________________________
From: David Miller [davem@davemloft.net]
Sent: Tuesday, November 17, 2009 11:05 PM
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Shreyas Bhatewara
Subject: Re: linux-next: net tree build failure

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 18 Nov 2009 16:51:45 +1100

> drivers/net/vmxnet3/vmxnet3_drv.c: In function 'vmxnet3_prepare_tso':
> drivers/net/vmxnet3/vmxnet3_drv.c:826: error: implicit declaration of function 'csum_ipv6_magic'
>
> Revealed by commit 115924b6bdc7cc6bf7da5b933b09281e1f4e17a9 ("net:
> Getting rid of the x86 dependency to built vmxnet3") which allowed this
> driver to be built on PowerPC at all.

Enabling on more platforms helps find problems like this :-)

> Subject: [PATCH] net: using csum_ipv6_magic requires including net/ip6_checksum.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks!




Thanks Stephen,

I cross-compiled the patched kernel for sparc. Didn't do it for PowerPC :(

->Shreyas