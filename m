From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Thu, 2 Jul 2015 10:30:25 +1000
Message-ID: <20150702103025.634ca1e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S4x/b66IZ4nw1AO9K0g2J=J"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44306 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753924AbbGBAac (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jul 2015 20:30:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, Geert Uytterhoeven <geert+renesas@glider.be>

--Sig_/S4x/b66IZ4nw1AO9K0g2J=J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Today's linux-next merge of the kbuild tree got a conflict in:

  scripts/kconfig/Makefile

between commits:

  9bcd776d299e ("kconfig: clarify kvmconfig is for kvm")
  6c6685055a28 ("kconfig: add xenconfig defconfig helper")

from Linus' tree and commit:

  fa75a727c019 ("kconfig: Wrap long "make help" text lines")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc scripts/kconfig/Makefile
index f52abae0ec5f,930de225d52e..000000000000
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@@ -142,9 -139,9 +143,10 @@@ help
  	@echo  '  alldefconfig    - New config with all symbols set to default'
  	@echo  '  randconfig	  - New config with random answer to all options'
  	@echo  '  listnewconfig   - List new options'
- 	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols =
to their default value'
+ 	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols =
to their'
+ 	@echo  '                    default value'
 -	@echo  '  kvmconfig	  - Enable additional options for guest kernel suppo=
rt'
 +	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel s=
upport'
 +	@echo  '  xenconfig       - Enable additional options for xen dom0 and g=
uest kernel support'
  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 =20
  # lxdialog stuff

--Sig_/S4x/b66IZ4nw1AO9K0g2J=J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVlIYmAAoJEMDTa8Ir7ZwV2GUP+gOUrciTEGfAobW67xByyuaC
8B2y2doYMs74fcE4ZAciG13voGJ6BvU2vSnHeuhNPPwZUI74+kndoxOymTcbiyx/
71unySD1P3Ne4l3aF2y78IYLKU2Y0+HJHD4cVhtJ2I9XLdm9efa5yph3RQrCFMW8
ZCqxjTfMm6SM7VoAIgpnv+fYTEjg6r9godKPzD1kUb3ooXjz0gjqAjtAJ252rbSo
q1LHlp3UoRIL0lrRariblI11+1YuivW+nLUklLxxc6a4BeXTSx+G1PCrTdsziC1K
lQy64KEP0+n0jkKoE8W1HGH1KJiZMQ3tbxD7jLjiDnkC0WlOwIIz/nwvhhYpY/6Y
JGIDzneBi3ldwXjtYZ9D3DBebA9APzWaHX+VtS1PCGWzliv8yxiYbN641C3qc4Pq
vnTuSc5E6DG33gv6T+x7mK/EcZLVI/ls1GwMjOGyHq4AFVMsWKFJtS4Ix3CVjjeB
pGVC66T+0Mql+WFW2MMeaYu89bOFpv50SB9gZn0r2+2tTD7ew+l7C89+bWkyeCC5
DkKGE4PJHXx+3grRA0yPhhKR1estnDkTRo6j2pXmLEGN7lvTYeo4kiHWvcwCKidi
TjizDwIfn9/jircFSJNRbhp5cykJzGJ8lpXl/A94ee+g5DD+B36JU7zJgG0+1Wr/
XDCDAagA6LhjHgwWJGCW
=s3oS
-----END PGP SIGNATURE-----

--Sig_/S4x/b66IZ4nw1AO9K0g2J=J--
