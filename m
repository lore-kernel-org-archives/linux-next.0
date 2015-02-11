From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Wed, 11 Feb 2015 02:41:35 +0100
Message-ID: <1544592.4ITKEDgnAg@vostro.rjw.lan>
References: <20150211120755.50217078@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1733597.XvB5ZcUmqD"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:53466 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750823AbbBKBSi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2015 20:18:38 -0500
In-Reply-To: <20150211120755.50217078@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>


--nextPart1733597.XvB5ZcUmqD
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, February 11, 2015 12:07:55 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/of/of_pci.c between commit d2be00c0fb5a ("of/pci: Free
> resources on failure in of_pci_get_host_bridge_resources()") from the
> pci tree and commit 5c493df25a0d ("Merge branch 'pci/host-generic' of
> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci into
> acpi-resources") from the pm tree.
> 
> I fixed it up (I just use the latter version, please check when it
> comes out) and can carry the fix as necessary (no action is required,
> though someone might want to tell Linus how to resolve it - including
> the removal of the "kfree(bus_range);").

Sorry, I messed this up.  The commit that supposed to be a merge ended
up as a non-merge commit in my tree, just because I tried to modify
the changelog of it without doing the merge again.

Then, I should have noticed that when I was putting together the pull request
for Linus earlier today, but then I didn't.

Rafael

--nextPart1733597.XvB5ZcUmqD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJU2rNVAAoJEILEb/54YlRx2eAQAJNirtS2AHUHepuNPi4irXXA
06DKJ4BuRoSdkCCzhKTuAUSrwSf6QR+fQmabQVqCXYA0kIoUktbotzOSlPzjYzqV
NMdT/4iBc6MlzqzMwoVKWVrG+bwehNa//wQn8jTGiqE6QI2RBrpFv3ZDXCNt+IvI
5FKo0un3CRQeUhsUyv+3N2UnOptbJIzPAd5hYrJsDrFFzcz6/BV7VELnFdA8mv/K
Z9qndK25YkcbnCKKHvOLm4URapcFV3M8nyDux+0U+LVKNSm9LTG7/8H6GLZFroAr
HkfLbMcYR5AnWnOSOnQmQ1EVUQ2N1sp/FGpAjfjno0SVmU7ofGB3+8aq/on6UXi6
vTEqyIbb7mX3MphIPGvCBfcBbDLpRGpf9V3mRB+lULiYDMt3RhXRnZb24feagLfZ
9ZjULsbwuqL4x7sTd7/gw1o6sayqZo7k5gHnDovcj6M8qQfniVQZHQvpJcI2/sYK
je1r9Xagrd3+r19L8/ld27BC++xvuj8mGExYfNEWX2egj/EKHZsVKblNzWx7lXe/
vJJlF34DwjF0+yf4Cys2DtJfSxKjqdatt3wY4od1cOr1R0L5trh/mWnLvh6awrSL
DNx8LLgzC2sCtSsI9F4FVatJirWtN9iw41zE+qCNnPxrFzYIK5Sdn0ZZNZPmzW5U
ClavQodtpS0uFer/Lsz3
=3b2R
-----END PGP SIGNATURE-----

--nextPart1733597.XvB5ZcUmqD--
