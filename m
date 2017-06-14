From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 sound-asoc tree
Date: Wed, 14 Jun 2017 15:30:55 +0100
Message-ID: <20170614143055.5v6j4i5au3t3fw7s@sirena.org.uk>
References: <20170614125423.48266e23@canb.auug.org.au>
 <CAL_Jsq+h8Bx9Ks8K8f6G7JJcouqChUEX40T4xosBdk+1GJiQiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="glxsbqjrgyhckia6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58370 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750717AbdFNObH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 10:31:07 -0400
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+h8Bx9Ks8K8f6G7JJcouqChUEX40T4xosBdk+1GJiQiQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sakari Ailus <sakari.ailus@linux.intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


--glxsbqjrgyhckia6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 14, 2017 at 08:55:37AM -0500, Rob Herring wrote:

> Sakari, I forgot about these other changes and the resolution is more
> complex than I want to pass on to Linus. Has the branch I provided
> been pulled in (I guess not since this is the first I've seen of the
> conflict)? We should drop the move for now and do it late in the merge
> window or post -rc1. It can be after your other changes.

I can send you a pull request for the changes in my tree so you can do
the resolution if that helps?

--glxsbqjrgyhckia6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllBSJ8ACgkQJNaLcl1U
h9BMnQf8C2c4dBOP+WmmxLyZhAq0ZYHAj30Ryjz5mCh6lyw8rtdTMsertJ17EzL2
EHDErB8w2qST7qmhWLCTHsh1T5Jn+Jhg4CKHBndyW9AH6+2AN2mOhucyKggyikaO
Hjmg4JQFX8XRHkxWDscWYOTGvgzszOQfVWc32KFhIw6ScavZ4rm7mtUeRPJso8FC
/yHnsvEo3g9bNq5YJxjZIqXoq82WpnhjC6ztIHYiuYIpl++WFjKiqU4sWN7cuH9k
BpHtvpgfbRwv8J1frW6C9pzfF2o+70ekY4eDvC1fx0D03oYKuBe/0g/Fu4hpdLh8
jQ1xhMXVo3oZJ6vz9Ru5sJXJG+C4Qw==
=uOkq
-----END PGP SIGNATURE-----

--glxsbqjrgyhckia6--
