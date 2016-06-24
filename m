From: "Benedetto, Salvatore" <salvatore.benedetto@intel.com>
Subject: RE: linux-next: build failure after merge of the crypto tree
Date: Fri, 24 Jun 2016 13:36:58 +0000
Message-ID: <309B30E91F5E2846B79BD9AA9711D031937E40@IRSMSX102.ger.corp.intel.com>
References: <20160624162022.0f9c265a@canb.auug.org.au>
 <20160624133329.GE21111@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160624133329.GE21111@gondor.apana.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Benedetto, Salvatore" <salvatore.benedetto@intel.com>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Herbert Xu [mailto:herbert@gondor.apana.org.au]
> Sent: Friday, June 24, 2016 2:33 PM
> To: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Benedetto,
> Salvatore <salvatore.benedetto@intel.com>
> Subject: Re: linux-next: build failure after merge of the crypto tree
> 
> On Fri, Jun 24, 2016 at 04:20:22PM +1000, Stephen Rothwell wrote:
> > Hi Herbert,
> >
> > After merging the crypto tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >
> > net/built-in.o: In function `.ecdh_shared_secret':
> > (.text+0x4ad8d0): multiple definition of `.ecdh_shared_secret'
> > crypto/built-in.o:(.text+0x113f0): first defined here
> > net/built-in.o:(.opd+0x430e0): multiple definition of `ecdh_shared_secret'
> > crypto/built-in.o:(.opd+0x1d40): first defined here
> >
> > Caused by commit
> >
> >   3c4b23901a0c ("crypto: ecdh - Add ECDH software support")
> >
> > The other definition is in net/bluetooth/ecc.c
> >
> > I added the following patch for today (probably a better name could be
> > chosen):
> 
> I think the intention is that net/bluetooth/ecc.c will be deleted in favour of
> the implementation in crypto.  But for now I have applied your patch so we
> can progress.  Thanks Stephen.

Thanks Stephen, Herbert.

I already submitted the patch to the Bluetooth subsystem that removes
the net/Bluetooth/ecc.c module

Apologies for the inconvenience.

Regards,
Salvatore
