From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Thu, 13 Aug 2015 07:53:22 +1000
Message-ID: <20150813075322.064035f8@canb.auug.org.au>
References: <20150812233914.451d1fcf@canb.auug.org.au>
	<55CB8AF0.4060905@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <55CB8AF0.4060905@infradead.org>
Sender: linux-pci-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, Tadeusz Struk <tadeusz.struk@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi Randy,

On Wed, 12 Aug 2015 11:05:36 -0700 Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> on i386 or x86_64:
>=20
> Many (repeated) errors like this one:
>=20
> ../include/linux/pci.h:390:12: error: =C3=A2=C2=80=C2=98struct pci_de=
v=C3=A2=C2=80=C2=99 has no member named =C3=A2=C2=80=C2=98physfn=C3=A2=C2=
=80=C2=99
>=20
> when CONFIG_PCI_ATS is not enabled.

Maybe caused by commit

  dd0f368398ea ("crypto: qat - Add qat dh895xcc VF driver")

from the crypto tree Which adds a

  select PCI_IOV

to drivers/crypto/qat/Kconfig without the necessary

  select PCI

but PCI_IOV selects PCI_ATS, so I am not sure what happened here.  I am
assuming that your config has PCI_IOV enabled?  What about PCI?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
