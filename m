From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pci tree
Date: Wed, 4 Sep 2013 09:55:27 +1000
Message-ID: <20130904095527.d5e694435fd03a5252de0d42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__4_Sep_2013_09_55_27_+1000_10x=.VvTrFK5l0WB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:46314 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934077Ab3ICXz2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2013 19:55:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__4_Sep_2013_09_55_27_+1000_10x=.VvTrFK5l0WB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

You have sent a pull request to Linus for the pci tree, but at the same
time you have reset the branch I pull into linux-next to be v3.11.  So
you have effectively removed all that code from linux-next until Linus'
merges it :-(

Ordering is important.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__4_Sep_2013_09_55_27_+1000_10x=.VvTrFK5l0WB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSJnbvAAoJEECxmPOUX5FELGAP/j2Tw8oQ7qTylghowuPZiQKG
clk4hcLa7dUsFgaEYoIfGscy0Ws7GuN3Yw1HXqE01x/tjy0smTZXX06BOuYU8p3F
efc3aHQdD2fGDtkRWv1xVE++sXH8tGyIn0WSP9xydyTRhYSl3BJdLsAf471PSNq5
7a2ueHMHRqSPngxvF4G5FM/06ntnl7gQdZUQE6NSGjAf1O4lJpEvMSM6DcJmGsT5
EZzdS5n+m9B3V++Azj80nCLOgiA2EbNYnakeB3VE4t1OfOZPu8TxUOLjx5lCRUmo
5AYkwRNlL55qZXjN8ibrZVZ6CAaRSyj46VyRLLwOqO62EnoSDGqwJSsqVUtxB9Op
JS2EQTP/4vVOHsNw77k4fYxH0xUiqthU1SMRg1juB4EtkFt2ZoLmoLwwFUp5akrh
uuWmoW/EkTsh0FvjL1IkIHo/I79bPH6fsUXS60N1+r3uYwLLDR4FWZLoeHhEFUcN
1Jy86LdoYSK5rDWf9T6Zj9y6l2rm3B2qvBfeFnP4jxZhLx4g8WxHXNVI7QWk+d5u
UsJ2pRcy6wm6i0vfays97ZKNMBN3tig87WFDPRKMs7gr/46h6LYjTqgAuLGwMJOC
+JfM3DsmdEq6kOLTNo/NTBLVPirhCY0xuoLBb4T0B+kqIaOA0rPAztqJbqBsp4XT
FV3kt3cpX1hIMl1NsXep
=EqjB
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Sep_2013_09_55_27_+1000_10x=.VvTrFK5l0WB--
