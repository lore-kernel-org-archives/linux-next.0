From: Valdis.Kletnieks@vt.edu
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 21:35:32 -0500
Message-ID: <39351.1231814132@turing-police.cc.vt.edu>
References: <20090112154539.4857f533.sfr@canb.auug.org.au> <496B899E.7060605@oracle.com> <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com> <20090112191330.GC7111@suse.de> <524f69650901121307v67047946yed2c56efaaa839a1@mail.gmail.com> <37759.1231812066@turing-police.cc.vt.edu>
            <1231813669.6868.3.camel@norville.austin.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1231814132_3124P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from turing-police.cc.vt.edu ([128.173.14.107]:51386 "EHLO
	turing-police.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756170AbZAMCgo (ORCPT
	<RFC822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 21:36:44 -0500
In-Reply-To: Your message of "Mon, 12 Jan 2009 20:27:49 CST."
             <1231813669.6868.3.camel@norville.austin.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Cc: Steve French <smfrench@gmail.com>, Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

--==_Exmh_1231814132_3124P
Content-Type: text/plain; charset=us-ascii

On Mon, 12 Jan 2009 20:27:49 CST, Dave Kleikamp said:
> On Mon, 2009-01-12 at 21:01 -0500, Valdis.Kletnieks@vt.edu wrote:
> > On Mon, 12 Jan 2009 15:07:48 CST, Steve French said:
> > 
> > > I have changed the names of cifs's md5 functions in the cifs-2.6.git tree
> > > 
> > > diff --git a/fs/cifs/md5.h b/fs/cifs/md5.h
> > > index f7d4f41..6fba8cb 100644
> > 
> > I presume there will be another git commit immediately following to fix
> > up the call sites?
> 
> The git tree has the entire fix.  Steve's post just contained a piece of
> it.

Oh, OK. Thanks for verifying that for those of us playing along at home. ;)

--==_Exmh_1231814132_3124P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFJa/30cC3lWbTT17ARAuMZAKDUj28nPKSsiv/uumbllpKyCTxbDgCfQwTz
KbZ2YCX40r14nxSBk1xJXVk=
=/UTS
-----END PGP SIGNATURE-----

--==_Exmh_1231814132_3124P--
