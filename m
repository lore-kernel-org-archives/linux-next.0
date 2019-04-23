From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 23 (crypto/ecrdsa)
Date: Tue, 23 Apr 2019 08:22:40 -0700
Message-ID: <ea752c71-b41f-47f5-290b-3a31bb0e96df@infradead.org>
References: <20190423202832.49cdf5bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423202832.49cdf5bc@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Chikunov <vt@altlinux.org>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 4/23/19 3:28 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Thursday April 25.
> 
> Changes since 20190418:
> 

on i386 or x86_64:

ERROR: "asn1_ber_decoder" [crypto/ecrdsa_generic.ko] undefined!
ERROR: "look_up_OID" [crypto/ecrdsa_generic.ko] undefined!


Do you need a failing config file?

thanks.
-- 
~Randy
