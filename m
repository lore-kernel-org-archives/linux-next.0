Return-Path: <SRS0=mT+L=DU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9528C433E7
	for <linux-next@archiver.kernel.org>; Tue, 13 Oct 2020 22:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCBAA2177B
	for <linux-next@archiver.kernel.org>; Tue, 13 Oct 2020 22:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HsPWea3p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgJMWRA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Oct 2020 18:17:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbgJMWRA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 18:17:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9qf016MZz9sVR;
        Wed, 14 Oct 2020 09:16:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602627416;
        bh=sDFrJVbSjAb4Na2vQERtLv1Si0Dy6RHu1h+e/9rQT34=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HsPWea3puPQlbnlAT0ovVwBHrFlhULVQTFVOmqmFHRbOLH2seV9zxxTY5KWS9t6Jp
         d5b4mU1ZK1PCzlARXtyd9f8g/dv8frdeCOcwenSOsLNtFXLAqg0aCcFnBV2LNF9wjl
         FJ272d4tklKQdz9kl63d2d4kupiEQrkIReyDar8zkGebeTMGnEdwUmUUq2GNOlc8i4
         /sYg/hJ55rNKiI9cCN/FPjDrqf4WJdshFZZLHm/m6rWvde6mTD5h0IlgDJNtc4yV4N
         K72pg3Ic1QRnAyxQt+IrWf+OBtoJ+LEoRinyeoXm79R1LwOmj6dUGmmFptPaLznYdt
         7k2TQ+e+tvL8A==
Date:   Wed, 14 Oct 2020 09:16:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Diana Craciun OSS <diana.craciun@oss.nxp.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <20201014091653.0ec43501@canb.auug.org.au>
In-Reply-To: <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
References: <20201013140744.64937ecd@canb.auug.org.au>
        <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CI==/4.E8yuciQQGB_eKTuJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CI==/4.E8yuciQQGB_eKTuJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Diana,

On Tue, 13 Oct 2020 18:56:07 +0300 Diana Craciun OSS <diana.craciun@oss.nxp=
.com> wrote:
>
> Hi,
>=20
> How does it fail? What's the error?

Sorry about that:

drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c: In function 'vfio_fsl_mc_set_irq_tr=
igger':
drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:121:8: error: implicit declaration o=
f function 'fsl_mc_populate_irq_pool' [-Werror=3Dimplicit-function-declarat=
ion]
  121 |  ret =3D fsl_mc_populate_irq_pool(mc_cont,
      |        ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:122:4: error: 'FSL_MC_IRQ_POOL_MAX_T=
OTAL_IRQS' undeclared (first use in this function)
  122 |    FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_release':
drivers/vfio/fsl-mc/vfio_fsl_mc.c:178:9: error: implicit declaration of fun=
ction 'dprc_reset_container' [-Werror=3Dimplicit-function-declaration]
  178 |   ret =3D dprc_reset_container(mc_cont->mc_io, 0,
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:181:6: error: 'DPRC_RESET_OPTION_NON_RECU=
RSIVE' undeclared (first use in this function)
  181 |      DPRC_RESET_OPTION_NON_RECURSIVE);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:181:6: note: each undeclared identifier i=
s reported only once for each function it appears in
drivers/vfio/fsl-mc/vfio_fsl_mc.c:191:3: error: implicit declaration of fun=
ction 'fsl_mc_cleanup_irq_pool' [-Werror=3Dimplicit-function-declaration]
  191 |   fsl_mc_cleanup_irq_pool(mc_cont);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_ioctl':
drivers/vfio/fsl-mc/vfio_fsl_mc.c:316:9: error: 'DPRC_RESET_OPTION_NON_RECU=
RSIVE' undeclared (first use in this function)
  316 |         DPRC_RESET_OPTION_NON_RECURSIVE);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
drivers/vfio/fsl-mc/vfio_fsl_mc.c:455:36: error: 'FSL_MC_REGION_CACHEABLE' =
undeclared (first use in this function)
  455 |  region_cacheable =3D (region.type & FSL_MC_REGION_CACHEABLE) &&
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:456:22: error: 'FSL_MC_REGION_SHAREABLE' =
undeclared (first use in this function)
  456 |       (region.type & FSL_MC_REGION_SHAREABLE);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_bus_notifier':
drivers/vfio/fsl-mc/vfio_fsl_mc.c:522:9: error: 'struct fsl_mc_device' has =
no member named 'driver_override'
  522 |   mc_dev->driver_override =3D kasprintf(GFP_KERNEL, "%s",
      |         ^~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:524:14: error: 'struct fsl_mc_device' has=
 no member named 'driver_override'
  524 |   if (!mc_dev->driver_override)
      |              ^~
drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_init_device':
drivers/vfio/fsl-mc/vfio_fsl_mc.c:561:8: error: implicit declaration of fun=
ction 'dprc_setup' [-Werror=3Dimplicit-function-declaration]
  561 |  ret =3D dprc_setup(mc_dev);
      |        ^~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:567:8: error: implicit declaration of fun=
ction 'dprc_scan_container' [-Werror=3Dimplicit-function-declaration]
  567 |  ret =3D dprc_scan_container(mc_dev, false);
      |        ^~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:576:2: error: implicit declaration of fun=
ction 'dprc_remove_devices' [-Werror=3Dimplicit-function-declaration]
  576 |  dprc_remove_devices(mc_dev, NULL, 0);
      |  ^~~~~~~~~~~~~~~~~~~
drivers/vfio/fsl-mc/vfio_fsl_mc.c:577:2: error: implicit declaration of fun=
ction 'dprc_cleanup' [-Werror=3Dimplicit-function-declaration]
  577 |  dprc_cleanup(mc_dev);
      |  ^~~~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/CI==/4.E8yuciQQGB_eKTuJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+GJ1UACgkQAVBC80lX
0Gz29Af3UcKOzLkYILRdwuiN0dJanPLzvu/R2p7yQsD53/wt1D+vUUZ8unxLFzVl
hMO86Ih450hhSfP50/oKJEgdxo+Azz1spE5Cgv7/LjmbqeDP2/dDWiTe44ZIerHH
Ui3sj2wEQsxdovU2v7/UwMNGRlSNcLIKhXpJ5gjpFG+sZUCCrTnZffwbIXxAZcLO
lmCA90c9szn0O6wajVSS6FDx9uFSCq4avYfevUJvsFPTJ4c/U7UkiDCKZjFwpwdG
3E7w8oY0OWOXjPWXE4YC7CcmexpYefkQ0uMSkUv04gch6eQJX1RDZiDLotTGGhTW
2J7d1NjSEhNh+O4je0GD2+k6fMU8
=mi1u
-----END PGP SIGNATURE-----

--Sig_/CI==/4.E8yuciQQGB_eKTuJ--
