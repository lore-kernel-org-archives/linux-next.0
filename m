From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: build failure at x86/kernel/pci-dma.c with !CONFIG_PCI
Date: Fri, 24 Oct 2008 16:56:24 +1100
Message-ID: <20081024165624.7d9bfae3.sfr@canb.auug.org.au>
References: <a4423d670810231609h76323d2fqa4ed7d9ba0a46e3b@mail.gmail.com>
	<20081023235100.GA2192@linux-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Oct_2008_16_56_24_+1100_jtsj1iZXcKHyj/fe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46632 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751066AbYJXF4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 01:56:38 -0400
In-Reply-To: <20081023235100.GA2192@linux-os.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Woodhouse, David" <david.woodhouse@intel.com>, linux-next@vger.kernel.org, mingo@elte.hu, fujita.tomonori@lab.ntt.co.jp, adobriyan@gmail.com

--Signature=_Fri__24_Oct_2008_16_56_24_+1100_jtsj1iZXcKHyj/fe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Oct 2008 16:51:00 -0700 Fenghua Yu <fenghua.yu@intel.com> wrote:
>
> On Thu, Oct 23, 2008 at 04:09:52PM -0700, Alexander Beregalov wrote:
> > arch/x86/kernel/built-in.o: In function `iommu_setup':
> > pci-dma.c:(.init.text+0x36ad): undefined reference to `forbid_dac'
> > pci-dma.c:(.init.text+0x36cc): undefined reference to `forbid_dac'
> > pci-dma.c:(.init.text+0x3711): undefined reference to `forbid_dac
> >=20
> > commit 5b6985ce8ec7127b4d60ad450b64ca8b82748a3b
> > Author: Fenghua Yu <fenghua.yu@intel.com>
> > Date:   Thu Oct 16 18:02:32 2008 -0700
> >=20
> >     intel-iommu: IA64 support
>=20
> Could you please try the following fix patch?

I have added this patch to today's linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Oct_2008_16_56_24_+1100_jtsj1iZXcKHyj/fe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkBY4gACgkQjjKRsyhoI8zLQwCZAcKBY++xWl8zqQOJ0qvFm1LT
PnsAn037vcY1O2HJzIdYorVHDiElqN1m
=tCod
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Oct_2008_16_56_24_+1100_jtsj1iZXcKHyj/fe--
