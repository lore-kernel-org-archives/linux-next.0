From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: semaphore-removal/scsi-rc-fixes merge conflicts
Date: Thu, 26 Jun 2008 17:15:41 +1000
Message-ID: <20080626171541.eb88cbd1.sfr@canb.auug.org.au>
References: <20080602171213.59aaba42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_17_15_41_+1000_8oMPcsaWCBpzqs12"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39825 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874AbYFZHP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 03:15:57 -0400
In-Reply-To: <20080602171213.59aaba42.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>, Matthias Kaehlcke <matthias@kaehlcke.net>, Andrew Vasquez <andrew.vasquez@qlogic.com>, Daniel Walker <dwalker@mvista.com>

--Signature=_Thu__26_Jun_2008_17_15_41_+1000_8oMPcsaWCBpzqs12
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Mon, 2 Jun 2008 17:12:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the semaphore-removal tree got conflicts in
> drivers/scsi/qla2xxx/{qla_attr.c,qla_def.h,qla_mbx.c,qla_mid.c,qla_os.c}
> between commits e1e82b6f0df0c5175ddd3d4f8862507aa71da8e9 ("[SCSI]
> qla2xxx: firmware semaphore to mutex") and
> 6c2f527cb84cbd7d2d8a668c979e70bf78980ccc ("[SCSI] qla2xxx: Convert
> vport_sem to a mutex") from the scsi-rc-fixes tree and commits
> 5469811b8b0085c0f19fd3aaad29cde59761e243 ("qla2xxx: Turn vport_sem into
> vport_mutex") and e2c6f1aa2f67c585ffcb879d32ff3e74b53faf25 ("Convert
> qla_os to use mutex instead of semaphore") from the semaphore-removal
> tree.
>=20
> These pairs of commits did the same thing except for
> 	a change of name (vport_lock v. vport_mutex).
> 	a use of mutex_lock() instead of mutex_lock_killable()
>=20
> I took the versions from scsi-rc_fixes (since they will probably be
> submitted to Linus for 2.6.26 - Is that correct James?) except the use of
> mutex_lock_killable() from the semaphore-removal tree in
> drivers/scsi/qla2xxx/qla_os.c.
>=20
> Please check what I did.
>=20
> If its OK, then Willy should remove "qla2xxx: Turn vport_sem into
> vport_mutex" from the semaphore-removal tree.  And someone should decide
> about the use of mutex_lock_killable().

The two commits from the scsi-rc-fixes tree above have indeed been merged
in 2.6.26-rc5.  So, willy, can I ask you to redo the semaphore-removal
tree based on that - or just merge Linus' tree into the semaphore removal
tree.=20

Thanks in anticipation.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_17_15_41_+1000_8oMPcsaWCBpzqs12
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhjQh0ACgkQTgG2atn1QN+wLQCcCMX75Ry+TeCZKapBa8aPXISK
pqgAoItTbfrOjjQdnQDejR/ZllMlPboW
=ZhqR
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_17_15_41_+1000_8oMPcsaWCBpzqs12--
