From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the ext3 tree
Date: Sat, 30 Mar 2019 16:19:39 +1100
Message-ID: <20190330161939.231c39cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZvcIm2HgQnLvSurBMojGEfZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yangerkun <yangerkun@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZvcIm2HgQnLvSurBMojGEfZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jan,

In commit

  47d92aa5d33a ("quota: fix a problem about transfer quota")

Fixes tag

  Fixes: 7b9ca4c61("quota: Reduce contention on dq_data_lock")

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ZvcIm2HgQnLvSurBMojGEfZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlye/GsACgkQAVBC80lX
0GwccQf9Ee6TWHw3Vr8SYL5S20PDLodzRs1sNKFZdmrln+7D0MDzCzdhhodjD3O+
uquOYZNrredVd9DfPNJJ4UmcwB7t1Nsu0JJWxgpVnUs23uuy+7Wrt1Im38RfEmPX
ZLPb+h6sKH3jKtppJCasURVwOuIxg+8msZuvE7A6ZODC3DIduSPLXgUkWexEV/MA
Co0QnYpVF8IOSn5GGeVKCxKHncjpwU7mym6yqQOnORVXIJceLnKQg81tpdVdyTzE
ww+/1IQ2SFFqUeweXp+OAVK3mLY5Qf0KG78BKMXvhcEeYrHph6WLbfUuEtFmSbA4
sOw6mUdtjkyCCcsh577N7lmodjPS0A==
=nAzx
-----END PGP SIGNATURE-----

--Sig_/ZvcIm2HgQnLvSurBMojGEfZ--
