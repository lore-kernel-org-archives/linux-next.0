From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with lots of trees
Date: Wed, 18 Oct 2017 00:21:36 +0100
Message-ID: <20171017232136.csbfpe4ieqnbqttr@sirena.org.uk>
References: <20171017194419.73s7cro4bvkaoukh@sirena.co.uk>
 <20171017144446.3beac671d798906122a21e38@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h6py65ktxax44zum"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37924 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754176AbdJQXVh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2017 19:21:37 -0400
Content-Disposition: inline
In-Reply-To: <20171017144446.3beac671d798906122a21e38@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--h6py65ktxax44zum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 02:44:46PM -0700, Andrew Morton wrote:
> On Tue, 17 Oct 2017 20:44:19 +0100 Mark Brown <broonie@kernel.org> wrote:

> > Today's linux-next merge of (well, import of) the akpm tree got a
> > bunch of patches that were either applied or have conflicts with other
> > trees, apparmor and btrfs stand out.

> I don't know why that should be.

> I have a cleanly applying linux-next.patch today (you fixed something?)
> so I can do a fresh mmotm a couple hours from now.

I did the fetch that went in today in the early hours of the morning
(well, the computer did).  I did need to do fixups in the process of
building -next but I'm not sure if that's what you mean here.

--h6py65ktxax44zum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnmkH8ACgkQJNaLcl1U
h9COlgf/baRIb1MvxRtJ2gDhjQ+oclgvzNHp3er/cbmVMgqvXaSgWwsUhCeWRgAA
Df83vblhrIblyyBKU+YgWL8n0MRobbLb2qcyAqGd9+hnv22RhgJv69od44qLartM
qgVjVG/EH5Q048U0RHcejJUwvZfOKibKVHSfw57tPheF9UY6JZdsTMaEj+j5Yymw
pvCIrOcU+ybVPlOYDuhESM3yU2zfPvCWs/mWBHZCJ+BVMzrMVBgDsrvMCGLpL4fn
heoH6An0krNPPyB0EMXTwanPDPWMDZUZljJP+2b1aUtEquLHZTpVNVo+AS1+4PDK
q8ZWtrtcW/JCZ6Z0l9RDXGLaIwHlww==
=qQj+
-----END PGP SIGNATURE-----

--h6py65ktxax44zum--
