From: Borislav Petkov <bp@suse.de>
Subject: Re: Crash caused by "EDAC: Rip out the edac_subsys reference
 counting" (was Re: linux-next: Tree for Dec 8)
Date: Wed, 9 Dec 2015 17:03:02 +0100
Message-ID: <20151209160301.GB10518@pd.tnic>
References: <20151208154910.78d27c03@canb.auug.org.au>
 <1449657167.17265.4.camel@ellerman.id.au>
 <20151209111747.GA10518@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151209111747.GA10518@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Scott Wood <scottwood@freescale.com>, Johannes Thumshirn <jthumshirn@suse.de>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 09, 2015 at 12:17:47PM +0100, Borislav Petkov wrote:
> On Wed, Dec 09, 2015 at 09:32:47PM +1100, Michael Ellerman wrote:
> > Presumably caused by the fact that edac_init() is subsys_initcall()=
, whereas
> > corenet_gen_publish_devices() is arch_initcall().
>=20
> Thanks for the report!
>=20
> Hmm, interesting, can you send .config please?
>=20
> I need to fix this dependency properly - edac_core needs to have
> finished loaded *before* any other EDAC driver loads. Every other ord=
er
> is wrong.

Yeah, see Johannes' patch.

Btw, calling a driver's probe function from outside the driver is a new
low in driver design. Tztztz...

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
