From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Tue, 24 Feb 2015 09:54:49 +1100
Message-ID: <20150224095449.243040b5@canb.auug.org.au>
References: <20150223102312.7029616b@canb.auug.org.au>
	<54EA8C99.50000@acm.org>
	<20150224072004.534ccb5a@canb.auug.org.au>
	<54EB9F33.6030702@acm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kpigiX9xSHhr3FIFHj9zDN5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49325 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752120AbbBWWy4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 17:54:56 -0500
In-Reply-To: <54EB9F33.6030702@acm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/kpigiX9xSHhr3FIFHj9zDN5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Corey,

On Mon, 23 Feb 2015 15:44:19 -0600 Corey Minyard <minyard@acm.org> wrote:
>
> Sourcefoge is definitely having issues:
>=20
>     [cminyard@t430 linux-ipmi]$ git push origin for-next
>     fatal: '/git/p/openipmi/linux-ipmi' does not appear to be a git
>     repository
>     fatal: Could not read from remote repository.
>=20
>     Please make sure you have the correct access rights
>     and the repository exists.
>=20
> After a while it started working, and the tag was there.  I've verified
> that everything is ok from a different machine.

I see the problem.  I expect for-next to be a branch, but it is a tag.
It is a real pain to pull a tag into a shared tree like mine (there
could be a for-next tag in every tree I fetch from ...).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/kpigiX9xSHhr3FIFHj9zDN5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU66++AAoJEMDTa8Ir7ZwVylsP/0j8S3u3KStvgpDXB3IABfBi
Y/o/WolAFvl8DcazZnYIS+afqd1xkHiB6gq7EFNFvY9k+8HHVicid9QtqMy3Ganm
65W41HOyWVmiNmwpkPPa1p0AwNq6vtLfQ9sOsllu8klg27p0mTiaae23px2TMhBf
5+pzBp/x2a0L42J0M+fuSiOi4zwvap9ImljPIEp20A6byUisWS/pBW393I58V/w+
teM6VBYSdWnp7wrOI8+/9zFZ9w1Tml0xr6r83TxV9V8ZirQR21sJLMB8QI37YO1c
Q7j7QycaErhaBBEpIA8hWsmnkt9q42ZurarCfWdaukp8efPQ+GzkfgEsOB/jgbm9
ufJf/gMPFGtsQF3oFPQ6I2x8/y3QoVF9V9O/B/iQdvz2MVhuxzcJuP1nTQf+08u8
LTPEeEi0+vZFmwul2FI97tTqsHyW04B+bo5QDEHwHDhHfnI9Wqt0DeiQc2i2VJDz
sHGyu4cIFUht4A0oPiBBPny2cAAZMHMqf3EbCSyWX4O0XhZ0pktAUWESu8+62le+
GANTflCZ+k4ZHlKsEuaDjwHeTZX9HRSC5gHXSPib8uuW9Tsmnrb3dcOzN/qyor9Z
QRxFNnuiZh4H2xPshtSeU2gbDc1GljuDlJMFizT2t6IMb3MrHvEBUV/JitiKipS2
LpE2tvyDw7oLvIFeK2RJ
=x555
-----END PGP SIGNATURE-----

--Sig_/kpigiX9xSHhr3FIFHj9zDN5--
