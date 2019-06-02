From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch the mvebu tree
Date: Mon, 3 Jun 2019 08:23:46 +1000
Message-ID: <20190603082346.7bd1d7a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4738705737107779314=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============4738705737107779314==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lo5m9qPDu4oiX33meWAzxx2"; protocol="application/pgp-signature"

--Sig_/lo5m9qPDu4oiX33meWAzxx2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Tyring to fetch the mvebu tree
(git://git.infradead.org/linux-mvebu.git#for-next) for the past several
days produces this error message:

fatal: Couldn't find remote ref refs/heads/for-next

--=20
Cheers,
Stephen Rothwell

--Sig_/lo5m9qPDu4oiX33meWAzxx2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0THIACgkQAVBC80lX
0Gwsmgf/V9gzhu05NqlOLJkYaYO9nMmyYG530vlRb7UFezZH/01F88EoDHRkPZyX
/vSJV0KJZIII+hQYMpu0yTN2+RQZekxFgyA2cGrW/hqrtu6t4ZU8iJn7jpIUZx3u
BBKKozRC8CkmUvY1tLA338/ynwqtKilIwDzQBJjxcEF/ACeS7lkOqImkozGDVHiQ
+CKDvBkfMCEqNb4Nj5BWcW1MVlFNUBd+8poHvomGY9H47VgNoxx/qDn5EBXPiICX
lfUInXWb1Hfs5X+ZHF476VgJE7GeHeMFhAXp3bdDtjch9cBhjHCP4PHJ0dQxVIsd
BjNDhSQtBECbo4DapXK7m7A3pOIPEg==
=7xX9
-----END PGP SIGNATURE-----

--Sig_/lo5m9qPDu4oiX33meWAzxx2--


--===============4738705737107779314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4738705737107779314==--
