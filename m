From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Tue, 30 Mar 2010 01:12:03 +1100
Message-ID: <20100330011203.b2246ead.sfr@canb.auug.org.au>
References: <20100329105439.1e474095.sfr@canb.auug.org.au>
	<20100329152155.056741d2@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Mar_2010_01_12_03_+1100_Fv/DmUZzl8ZLJGNr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41447 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751156Ab0C2OMK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 10:12:10 -0400
In-Reply-To: <20100329152155.056741d2@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Tue__30_Mar_2010_01_12_03_+1100_Fv/DmUZzl8ZLJGNr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Mon, 29 Mar 2010 15:21:55 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>
> Err, sorry. I noticed the problem and fixed it some days ago, but
> forgot to refresh the patch before pushing it to you. This is fixed
> now, thanks for the notice.

Thanks. 2 less warnings ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Mar_2010_01_12_03_+1100_Fv/DmUZzl8ZLJGNr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuwtTMACgkQjjKRsyhoI8yRpQCfQiZcC1cxR/feB/U3ArbuGXM5
h5AAnj1ZMzZxOAtzZrMQTeeLR7v2w+H7
=03s5
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Mar_2010_01_12_03_+1100_Fv/DmUZzl8ZLJGNr--
