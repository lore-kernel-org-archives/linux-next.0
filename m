From: Valdis.Kletnieks@vt.edu
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 21:01:06 -0500
Message-ID: <37759.1231812066@turing-police.cc.vt.edu>
References: <20090112154539.4857f533.sfr@canb.auug.org.au> <496B899E.7060605@oracle.com> <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com> <20090112191330.GC7111@suse.de>
            <524f69650901121307v67047946yed2c56efaaa839a1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1231812066_3124P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from turing-police.cc.vt.edu ([128.173.14.107]:60707 "EHLO
	turing-police.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbZAMCBy (ORCPT
	<RFC822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 21:01:54 -0500
In-Reply-To: Your message of "Mon, 12 Jan 2009 15:07:48 CST."
             <524f69650901121307v67047946yed2c56efaaa839a1@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>
Cc: Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

--==_Exmh_1231812066_3124P
Content-Type: text/plain; charset=us-ascii

On Mon, 12 Jan 2009 15:07:48 CST, Steve French said:

> I have changed the names of cifs's md5 functions in the cifs-2.6.git tree
> 
> diff --git a/fs/cifs/md5.h b/fs/cifs/md5.h
> index f7d4f41..6fba8cb 100644

I presume there will be another git commit immediately following to fix
up the call sites?

--==_Exmh_1231812066_3124P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFJa/XicC3lWbTT17ARAvGUAJwIui/NEYEy2/96XEjV97AkQlIBsQCg2Y23
jh5cDZ94QxlEvMJrp4z+bvk=
=67Oz
-----END PGP SIGNATURE-----

--==_Exmh_1231812066_3124P--
