From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Wed, 12 Aug 2015 16:22:32 -0700
Message-ID: <55CBD538.4030903@infradead.org>
References: <20150812233914.451d1fcf@canb.auug.org.au>
 <55CB8AF0.4060905@infradead.org> <20150813075322.064035f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150813075322.064035f8@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, Tadeusz Struk <tadeusz.struk@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

On 08/12/15 14:53, Stephen Rothwell wrote:
> Hi Randy,
>=20
> On Wed, 12 Aug 2015 11:05:36 -0700 Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>>
>> on i386 or x86_64:
>>
>> Many (repeated) errors like this one:
>>
>> ../include/linux/pci.h:390:12: error: =C3=A2=C2=80=C2=98struct pci_d=
ev=C3=A2=C2=80=C2=99 has no member named =C3=A2=C2=80=C2=98physfn=C3=A2=
=C2=80=C2=99
>>
>> when CONFIG_PCI_ATS is not enabled.
>=20
> Maybe caused by commit
>=20
>   dd0f368398ea ("crypto: qat - Add qat dh895xcc VF driver")
>=20
> from the crypto tree Which adds a
>=20
>   select PCI_IOV
>=20
> to drivers/crypto/qat/Kconfig without the necessary
>=20
>   select PCI
>=20
> but PCI_IOV selects PCI_ATS, so I am not sure what happened here.  I =
am
> assuming that your config has PCI_IOV enabled?  What about PCI?
>=20

CONFIG_PCI is not enabled in my failing configs.
Testing the patch now.


--=20
~Randy
