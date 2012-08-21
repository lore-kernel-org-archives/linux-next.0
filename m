From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the workqueues tree with the hid tree
Date: Tue, 21 Aug 2012 13:58:32 +1000
Message-ID: <20120821135832.4788b9d64fea34502cca895a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__21_Aug_2012_13_58_32_+1000_3CsvSAo5SL7IK0rn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IkJydW5vIFByw6ltb250Ig==?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@jikos.cz>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__21_Aug_2012_13_58_32_+1000_3CsvSAo5SL7IK0rn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Today's linux-next merge of the workqueues tree got a conflict in
drivers/hid/hid-picolcd.c between commit fabdbf2fd22f ("HID: picoLCD:
split driver code") from the hid tree and commit 43829731dd37
("workqueue: deprecate flush[_delayed]_work_sync()") from the workqueues
tree.

The former commit moved the code changed by the latter into a new file
(and removed the old file) and then a later commit removed the call to
flush_work_sync().  I just removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__21_Aug_2012_13_58_32_+1000_3CsvSAo5SL7IK0rn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQMwdoAAoJEECxmPOUX5FEMC0QAJvmLkK/cIngc38DpmI4WLtP
zxwb7vU4z0OGoowkdUpyxLIxMqi5b98vJdS6pRaaOBaezdEgf1E817dxBJiliYgX
oIE9ZzjK5tspw/BDJrvhbOZlJKbjzyygaTjiLQQqjhtt+Thuuy4FvPMfc5uLwBYo
lCMgnrQzu15QrfzXq/Kv9FktDpWestIDwsxrRaQBSYfH44kC1tWWzN8wSYBVHXBO
xYk3TF8DV1qQLXdgBLoq75aIDba88lBL0W50pFh5+Us9yoBjh9b+niYat2R2IuGD
VLCVzZfPoTtAa5mvC0PtGGpeh1PwIXCoRUQ7daeaMnxNhtl4RI1ChXHyVA9O2vfs
ryc4KdhvmA3OXMfbfXKPjoxOTaY2wmFOIOc0xHyrq7yjQ0CILSYJ1lE+eAPYzHLn
RnVZfNiGvVpojbneGU6vsKvEeedjGLZnNtgR737fX0sa/KXaZyoCLuSHPt0OHbSU
4gFqJMGEHUmAoC8d8LGgRykYqh08fqEBbSw8NsGgaVszTaQvngISt07nFxUgT2mO
dcaXkQz3TDrkD3e/RFkrFwPvGb07sB3HTz0s+P9sHB0Ftkcutdb2jZwDJVNY/CYk
jX6jTXN5klpyKmMcI2NgSzVbU2Iy4C9TtymOpDT3LjkOQc4GxFOPdiOsNdyMNBcL
sfKFKfwN1dcsyobVOdvs
=3Ewt
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Aug_2012_13_58_32_+1000_3CsvSAo5SL7IK0rn--
