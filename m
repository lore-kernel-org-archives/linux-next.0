From: Tadeusz Struk <tadeusz.struk@intel.com>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Wed, 12 Aug 2015 15:58:30 -0700
Message-ID: <55CBCF96.7060102@intel.com>
References: <20150812233914.451d1fcf@canb.auug.org.au>	<55CB8AF0.4060905@infradead.org> <20150813075322.064035f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34275 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751527AbbHLW7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2015 18:59:38 -0400
In-Reply-To: <20150813075322.064035f8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Michal Marek <mmarek@suse.cz>

Hi,
On 08/12/2015 02:53 PM, Stephen Rothwell wrote:
> On Wed, 12 Aug 2015 11:05:36 -0700 Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>> >
>> > on i386 or x86_64:
>> >=20
>> > Many (repeated) errors like this one:
>> >=20
>> > ../include/linux/pci.h:390:12: error: =C3=A2=C2=80=C2=98struct pci=
_dev=C3=A2=C2=80=C2=99 has no member named =C3=A2=C2=80=C2=98physfn=C3=A2=
=C2=80=C2=99
>> >=20
>> > when CONFIG_PCI_ATS is not enabled.
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

There is a patch submitted, but not yet applied
https://patchwork.kernel.org/patch/6994171/
maybe it will help?
