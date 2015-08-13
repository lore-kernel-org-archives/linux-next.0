From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Wed, 12 Aug 2015 17:16:39 -0700
Message-ID: <55CBE1E7.60904@infradead.org>
References: <20150812233914.451d1fcf@canb.auug.org.au>
 <55CB8AF0.4060905@infradead.org> <20150813075322.064035f8@canb.auug.org.au>
 <55CBCF96.7060102@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <55CBCF96.7060102@intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: Tadeusz Struk <tadeusz.struk@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

On 08/12/15 15:58, Tadeusz Struk wrote:
> Hi,
> On 08/12/2015 02:53 PM, Stephen Rothwell wrote:
>> On Wed, 12 Aug 2015 11:05:36 -0700 Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
>>>>
>>>> on i386 or x86_64:
>>>>
>>>> Many (repeated) errors like this one:
>>>>
>>>> ../include/linux/pci.h:390:12: error: =C3=A2=C2=80=C2=98struct pci=
_dev=C3=A2=C2=80=C2=99 has no member named =C3=A2=C2=80=C2=98physfn=C3=A2=
=C2=80=C2=99
>>>>
>>>> when CONFIG_PCI_ATS is not enabled.
>> Maybe caused by commit
>>
>>   dd0f368398ea ("crypto: qat - Add qat dh895xcc VF driver")
>>
>> from the crypto tree Which adds a
>>
>>   select PCI_IOV
>>
>> to drivers/crypto/qat/Kconfig without the necessary
>>
>>   select PCI
>>
>> but PCI_IOV selects PCI_ATS, so I am not sure what happened here.  I=
 am
>> assuming that your config has PCI_IOV enabled?  What about PCI?
>=20
> There is a patch submitted, but not yet applied
> https://patchwork.kernel.org/patch/6994171/
> maybe it will help?

Yes, that works for me.  Thanks.


--=20
~Randy
