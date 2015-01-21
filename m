From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for
 pnp_acpi_device
Date: Thu, 22 Jan 2015 10:05:20 +1100
Message-ID: <20150122100520.3e4ddfe7@canb.auug.org.au>
References: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de>
	<20150122082350.121301eb@canb.auug.org.au>
	<20150122083432.2adaaee2@canb.auug.org.au>
	<201501212340.05536.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cKiVgk/NM7vtr/Flvq55h6g"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42600 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752330AbbAUXF2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 18:05:28 -0500
In-Reply-To: <201501212340.05536.PeterHuewe@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter =?UTF-8?B?SMO8d2U=?= <PeterHuewe@gmx.de>
Cc: linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>

--Sig_/cKiVgk/NM7vtr/Flvq55h6g
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 21 Jan 2015 23:40:04 +0100 Peter H=C3=BCwe <PeterHuewe@gmx.de> wrot=
e:
>
> Stephen, do you pull this patch in directly or shall it go via my tpmdd-t=
ree -
> > james -> -next ?

Normally these go via the tree maintainer (unless they affect me
directly - which this doesn't).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/cKiVgk/NM7vtr/Flvq55h6g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwDC2AAoJEMDTa8Ir7ZwVCt8P/iW84JN6XFjcsdNB57JDXzSA
7m5OEmzjG/xBhk4FEBi6hiicyMgCShv+JGcdizRtmTPhTpNbPmpnUjQy3r/IWRjZ
8ImX9HYruFy5RFy3nXh9dfGyCLDSf4+40X+8lAJDuV4NvA/XV5lU/rfgk5hmnZmc
Zr17CLvPXqXoxWIrHWh8EaNaZ+yyMJA3dLOnKxksoUfcXlEVsVQnO1eGVlHJe61a
PT4k0F8C4k6+45gxx2pUH5gLhqcXk0GTXdg+ye8qdmHC8SDY7gbG6oGdnpF4W/Qw
tojfr75f27eTUDd8y+PDrYkWtN4nlJHHDUKRksSbL394coY+f+oKhtHOo8GqT3he
U3DIbywdgGcr8vNaRZYCZbNu3iuLRvmcd0nBY6XZRAHsN5CCgHLtUpQm23IDFssg
R9LI9HrXRgzYpKHKtEcK4DMxboBeoZzBSHDEUH6qaX+I/Iqjij4MYLzTHhov25fi
43JbsBFYTtyodoGyVOft+mk4mKRO9RMX++EPlp6yqg6H4UbEj+Z16nudOIM+hYFY
W1KjqkCnDt3QwK/doMX9I7pUJEf9Aaa17Hfj259rwPpG1tw3uyLeUmxXcv1fkzfN
0q3nrjjZyhk1VZKvridXQpV+50x/xdNNd49u+svL+p954++rNbeUpk0v4/td7hyp
sLkfTrfELs1wmOsLWIqU
=EZE2
-----END PGP SIGNATURE-----

--Sig_/cKiVgk/NM7vtr/Flvq55h6g--
