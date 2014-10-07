From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: reminder
Date: Wed, 8 Oct 2014 09:57:34 +1100
Message-ID: <20141008095734.3aa28190@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DAYtdEU5E=vBd+w.KINsRbY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34775 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750895AbaJGW5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Oct 2014 18:57:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

--Sig_/DAYtdEU5E=vBd+w.KINsRbY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add material destined for v3.19 to your linux-next
included trees until *after* v3.18-rc1 has been released.

This would be a good time for maintainers to get their trees really
ready for the merge window i.e. test, fix bugs, squash warnings, make
sure all sub trees are merged ...

This is *not* a good time for rebasing/rewriting trees for other than
very critical reasons.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/DAYtdEU5E=vBd+w.KINsRbY
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUNG/jAAoJEMDTa8Ir7ZwVR78P/1X0dRCMLjFtteTbaiKV4JdZ
/VVAIfPrROUXW8ZZhgf84urnpSJkSv56QqTLok1RmZ5yU2DrHQdsi83h81e/sTyq
b9GFe0W0/P+ktYR5NlZpRrsHmC17RvhjGXpw742+QY3LN47E+lfHS/SBnZyDsJFc
n067eIbdjYd6Ckk7BXBZMVFqlmsnm8lu9VjyApHTskqyzc5Xw3xbpdCjmKSFRl0X
VDoKgchWx853+YKBWySOjrEFqvYE8oxxfs9sRjSuUyEMnujCnuHNl2tQ4+Y0jItY
JI7C4FQPTpJ/lI9eLFo2iDQnAyXE00nAFZaZggdx9+5AUDklEaTSatVtHT3aZT46
5lEOeOpSBMaUOAWoLpnpLT3vw+1sxyoiR1WkQ+4LD3VqxKlQj/VMJgLWch0djiaX
fK+v0p9Uqc8sjyIMVQxnN9mZghukkiocm8XtfU1jbB18jnFMaEGs5E6OlsMWyrkv
MXSpngCzDugARCUa1td1KTk5lMHb2C5VEcekxK8xNleGlhZZAWrbOy0M1mvTrT0/
Xgk2YQw3zo4ShHc0SFG2eMKuBRzKmkWogAQe0V7NMDBa70deQA81ya48OqLXkf+6
cTGCIn49Hwb/kwzw3H7EqzQbefuzd41YqG55lj9OMEMDelamwy74PQYZeUCVMphb
z9nUyCzsQWyO/vWDcxZa
=3Kt+
-----END PGP SIGNATURE-----

--Sig_/DAYtdEU5E=vBd+w.KINsRbY--
