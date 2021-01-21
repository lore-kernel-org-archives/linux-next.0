Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A46C433E6
	for <linux-next@archiver.kernel.org>; Thu, 21 Jan 2021 06:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64B592396D
	for <linux-next@archiver.kernel.org>; Thu, 21 Jan 2021 06:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbhAUGUt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 21 Jan 2021 01:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbhAUGUq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 01:20:46 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20B2C061575;
        Wed, 20 Jan 2021 22:20:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLsgk0dcpz9sWV;
        Thu, 21 Jan 2021 17:20:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611210002;
        bh=4Dh35RNoIoRmKF4TSoGIUwY5DxybVqXfZFfBxapXnjU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zg47c9JmgW4GfNsv41+EsA5xLJxrl1Kas/fK0/vYXtARoZnyH/zyMm1WM4iBZlnbk
         vVg4C2wKMFRaHyzo2f1rc6D9zOOdtR/nMvwTn43Fmr8aSy79L5nyCZdkYzCtez3MRC
         gMupM8KIaZxSOgVxHlYPCsIhipnrrnKjDZsj/VMXPS02kCzbrTSdNaFKHf2atDG4/H
         HcneWJ5QB2j0kDf2f6RUb7E3LHItvI9DklVE/ahguVpssb52dcG0Z1Ekh6V8gsfSJC
         zlwH+tTkAuRjxFrcJ39X3DIylUK8wfqy399GNvou803oQmMVoaFVFZfOrFBkwMa7QJ
         zVAurzyUTIG4Q==
Date:   Thu, 21 Jan 2021 17:20:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210121172001.3cb8b091@canb.auug.org.au>
In-Reply-To: <CAPcyv4jrrNthnSkj7RVjOMSDGJAoiw7KjniKaid5Jr-86B4Auw@mail.gmail.com>
References: <20210120162518.4fdc8f00@canb.auug.org.au>
        <CAPcyv4jrrNthnSkj7RVjOMSDGJAoiw7KjniKaid5Jr-86B4Auw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w=Wbr=4NuDq/YzB5jyRQN6r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w=Wbr=4NuDq/YzB5jyRQN6r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, 19 Jan 2021 21:48:52 -0800 Dan Williams <dan.j.williams@intel.com> =
wrote:
>
> On Tue, Jan 19, 2021 at 9:25 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Hi all,
> >
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > mm/memory_hotplug.c: In function 'move_pfn_range_to_zone':
> > mm/memory_hotplug.c:772:24: error: 'ZONE_DEVICE' undeclared (first use =
in this function)
> >   772 |  if (zone_idx(zone) =3D=3D ZONE_DEVICE) {
> >       |                        ^~~~~~~~~~~
> >
> > Caused by commit
> >
> >   e821cf25cfee ("mm: teach pfn_to_online_page() about ZONE_DEVICE secti=
on collisions")
> >
> > I applied the patch from Randy Dunlap for today.
> >
> > That, however, lead to this warning:
> >
> > mm/memory_hotplug.c:730:13: warning: 'section_taint_zone_device' define=
d but not used [-Wunused-function]
> >   730 | static void section_taint_zone_device(unsigned long pfn)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > =20
>=20
> I sent this one as an alternate:
>=20
> http://lore.kernel.org/r/161111619868.2787408.1710192276369197040.stgit@d=
willia2-desk3.amr.corp.intel.com

I have used that today instead of Randy's patch, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/w=Wbr=4NuDq/YzB5jyRQN6r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAJHREACgkQAVBC80lX
0GynRQgAgWJ+xgdQtkh9xL5sms6tckP0cMhi+5/DAHc8u6nJmqNmDHqYArAPs6yR
x5N65cwDiUgP7FHAzV5URBG8BWzbDpb3xP6dUBUIdRjiO2k/BCHWo9GGjKY9C4gv
Ufl0U4PA212Dz8YqL0mY3JzBnUP+eXNSDOWNUcksaMp2GWn1e9qP9esQpZzz2bTM
nHo9f1IQZmZYEX9j3Ox0WeSmtcqLZzgCHZ1l6E5ZA+caBPvSSw3cmC9DqIdHxJ3h
z2MoTY4V6ogSkskSgaryVSe7IRZmPOXcY2IrS8VeKxXhd64JfLwdDj33/mF6vccx
eYMCYAdjjdTmPraTmagrJXHVTbSptg==
=/W+7
-----END PGP SIGNATURE-----

--Sig_/w=Wbr=4NuDq/YzB5jyRQN6r--
