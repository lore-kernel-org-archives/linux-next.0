From: Vitaly Chikunov <vt@altlinux.org>
Subject: Re: linux-next: Tree for Apr 23 (crypto/ecrdsa)
Date: Tue, 23 Apr 2019 18:43:44 +0300
Message-ID: <20190423154343.xvubeub3ejhikfcn@altlinux.org>
References: <20190423202832.49cdf5bc@canb.auug.org.au>
 <ea752c71-b41f-47f5-290b-3a31bb0e96df@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ea752c71-b41f-47f5-290b-3a31bb0e96df@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Randy,

On Tue, Apr 23, 2019 at 08:22:40AM -0700, Randy Dunlap wrote:
> On 4/23/19 3:28 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release on Thursday April 25.
> > 
> > Changes since 20190418:
> > 
> 
> on i386 or x86_64:
> 
> ERROR: "asn1_ber_decoder" [crypto/ecrdsa_generic.ko] undefined!
> ERROR: "look_up_OID" [crypto/ecrdsa_generic.ko] undefined!
> 
> 
> Do you need a failing config file?

I will send a patch soon. Thanks!

> 
> thanks.
> -- 
> ~Randy
