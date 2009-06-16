From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the powerpc tree
Date: Tue, 16 Jun 2009 15:53:17 +1000
Message-ID: <20090616155317.d1f1217e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3834903865683729827=="
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Greg KH <greg@kroah.com>
Cc: Roel Kluin <roel.kluin@gmail.com>, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org, Geert@bilbo.ozlabs.org, Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
List-Id: linux-next.vger.kernel.org

--===============3834903865683729827==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Jun_2009_15_53_17_+1000_5CgLt.dtOYfaXZ9T"

--Signature=_Tue__16_Jun_2009_15_53_17_+1000_5CgLt.dtOYfaXZ9T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/block/ps3disk.c between commits
6dee2c87ebbe5d7ce8c4c163966a0bd9c02c75ef ("block/ps3: remove driver_data
direct access of struct device") and
03fa68c245cccbcb99035cbabaa13b408ba91ab5 ("ps3: shorten ps3_system_bus_
[gs]et_driver_data to ps3_system_bus_[gs]et_drvdata") from the powerpc
tree and commit db7afa200c4ef6823a2a40e4ea1dd747775be01a ("block/ps3:
remove driver_data direct access of struct device") from the driver-core
tree.

I fixed it up (I used the version from the powerpc tree).  Greg, I think
the driver-core patch is no longer relevant.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__16_Jun_2009_15_53_17_+1000_5CgLt.dtOYfaXZ9T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3M00ACgkQjjKRsyhoI8zt2QCgnGELqaTIr4Cq5z/mp7a3SKj0
ookAoJo1ynvM+Gk6mxycGKMAWyxX5Xr5
=tAe2
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Jun_2009_15_53_17_+1000_5CgLt.dtOYfaXZ9T--

--===============3834903865683729827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============3834903865683729827==--
