From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: randconfig build error with next-20131223, in
 arch/x86/crypto/aesni-intel_avx.S
Date: Mon, 30 Dec 2013 17:04:50 +0800
Message-ID: <20131230090450.GA8636@gondor.apana.org.au>
References: <CA+r1Zhh5As3QByXMvz0ha5Or2Xtxa3Y=QzuR75O7FwBKTk8XVA@mail.gmail.com>
 <20131223160238.GA15360@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131223160238.GA15360@pd.tnic>
Sender: linux-crypto-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-crypto@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 23, 2013 at 05:02:38PM +0100, Borislav Petkov wrote:
> On Mon, Dec 23, 2013 at 08:09:18AM -0700, Jim Davis wrote:
> > Building with the attached random configuration file,
> > 
> > arch/x86/crypto/aesni-intel_avx.S: Assembler messages:
> > arch/x86/crypto/aesni-intel_avx.S:1449: Error: bad register name `%r12'
> > [...]
> > arch/x86/crypto/aesni-intel_avx.S:2807: Error: bad register name `%r12'
> > make[2]: *** [arch/x86/crypto/aesni-intel_avx.o] Error 1
> 
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/x86 3.13.0-rc5 Kernel Configuration
> > #
> > # CONFIG_64BIT is not set
> > CONFIG_X86_32=y
> 
> Sounds like this aesni-intel_avx.S thing wasn't meant to be built for
> 32-bit.

Indeed.  Tim, can you provide me with a fix for this?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
