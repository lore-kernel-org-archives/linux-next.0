From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Thu, 26 Nov 2009 14:10:55 +1100
Message-ID: <20091126141055.d8c67798.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_14_10_55_+1100_qvjmtpKFXuR/J8HT"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Tourrilhes <jt@hpl.hp.com>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes@sipsolutions.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__26_Nov_2009_14_10_55_+1100_qvjmtpKFXuR/J8HT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net tree got a conflict in
net/wireless/wext.c between commit
9fed059667d35fca9288460106e92dbb8ba35ea1 ("WE: Fix set events not
propagated") from the  tree and commit
3d23e349d807177eaf519d444677cee86b1a04cf ("wext: refactor") from the net
tree.

The latter deleted the file that the former modified.  I just ignored the
wireless-current change and removed the file (which seems to have been
done in the latter change anyway).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_14_10_55_+1100_qvjmtpKFXuR/J8HT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksN8b8ACgkQjjKRsyhoI8wNBACeK6J7j5flVc/lq2ElnoaG7ESN
P2UAoL1bvM2trJ1w3zyjqZ+lB0Ibtz66
=sNVK
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_14_10_55_+1100_qvjmtpKFXuR/J8HT--
