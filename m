From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Thu, 20 Aug 2015 16:18:49 +1000
Message-ID: <20150820161849.79552437@canb.auug.org.au>
References: <20150812233914.451d1fcf@canb.auug.org.au>
	<55CB8AF0.4060905@infradead.org>
	<20150813075322.064035f8@canb.auug.org.au>
	<55CBCF96.7060102@intel.com>
	<CAErSpo4+H6AJs9shVGN8fm9=GwPL9EzNcyMNt5FW81JGEA1sDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo4+H6AJs9shVGN8fm9=GwPL9EzNcyMNt5FW81JGEA1sDA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Tadeusz Struk <tadeusz.struk@intel.com>, Randy Dunlap <rdunlap@infradead.org>, linux-next list <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild <linux-kbuild@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Bjorn,

On Wed, 19 Aug 2015 23:16:06 -0700 Bjorn Helgaas <bhelgaas@google.com> =
wrote:
>
> [+cc Yann, linux-kbuild]
>=20
> On Wed, Aug 12, 2015 at 3:58 PM, Tadeusz Struk <tadeusz.struk@intel.c=
om> wrote:
> > On 08/12/2015 02:53 PM, Stephen Rothwell wrote:
> >> On Wed, 12 Aug 2015 11:05:36 -0700 Randy Dunlap <rdunlap@infradead=
=2Eorg> wrote:
> >>> >
> >>> > on i386 or x86_64:
> >>> >
> >>> > Many (repeated) errors like this one:
> >>> >
> >>> > ../include/linux/pci.h:390:12: error: =C3=A2=E2=82=AC=CB=9Cstru=
ct pci_dev=C3=A2=E2=82=AC=E2=84=A2 has no member named =C3=A2=E2=82=AC=CB=
=9Cphysfn=C3=A2=E2=82=AC=E2=84=A2
> >>> >
> >>> > when CONFIG_PCI_ATS is not enabled.
> >> Maybe caused by commit
> >>
> >>   dd0f368398ea ("crypto: qat - Add qat dh895xcc VF driver")
> >>
> >> from the crypto tree Which adds a
> >>
> >>   select PCI_IOV
> >>
> >> to drivers/crypto/qat/Kconfig without the necessary
> >>
> >>   select PCI
> >>
> >> but PCI_IOV selects PCI_ATS, so I am not sure what happened here. =
 I am
> >> assuming that your config has PCI_IOV enabled?  What about PCI?
> >
> > There is a patch submitted, but not yet applied
> > https://patchwork.kernel.org/patch/6994171/
> > maybe it will help?
>=20
> I don't understand this.  In drivers/pci/Kconfig, we have:
>=20
>   config PCI_IOV
>     depends on PCI
>=20
> and in drivers/crypto/qat/Kconfig, dd0f368398ea adds:
>=20
>   config CRYPTO_DEV_QAT_DH895xCCVF
>     select PCI_IOV
>=20
> And apparently it's possible to end up with a .config with
> CONFIG_PCI_IOV=3Dy but CONFIG_PCI is not set?  That seems wrong, sinc=
e
> we declared that PCI_IOV depends on PCI.  Does select ignore that
> dependency somehow?

Yeah, unfortunately that is how select works.  If a symbol you select
depends on anything, then you need to also select all the dependencies.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
