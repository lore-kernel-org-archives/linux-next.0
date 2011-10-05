From: Valdis.Kletnieks@vt.edu
Subject: Re: linux-next: Tree for Oct 5
Date: Wed, 05 Oct 2011 08:09:19 -0400
Message-ID: <27222.1317816559@turing-police.cc.vt.edu>
References: <20111005193750.78af4ac777e9b69230d62375@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1317816559_4646P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:53651 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934334Ab1JEMKc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Oct 2011 08:10:32 -0400
In-Reply-To: Your message of "Wed, 05 Oct 2011 19:37:50 +1100."
             <20111005193750.78af4ac777e9b69230d62375@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--==_Exmh_1317816559_4646P
Content-Type: text/plain; charset=us-ascii

On Wed, 05 Oct 2011 19:37:50 +1100, Stephen Rothwell said:

> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/v2.6/next/ ). 

So I managed to bodger up my local linux-next tree, decided to start from
scratch. Had a good 'git pull' of Linus's tree from yesterday, so I did a 'git
clone -l' of that. Then:

[/usr/src/linux-next] git remote add linux-next git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
[/usr/src/linux-next] git fetch linux-next
fatal: The remote end hung up unexpectedly

Am I pointing something in the wrong place, or does git need to be kicked at
the kernel.org end? It's apparently tree-specific - pulling Linus's tree from
git.kernel.org works just fine.


--==_Exmh_1317816559_4646P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFOjEjvcC3lWbTT17ARArTKAJ9sSapFu2oFt2X/rsxkaZ/mSRjnAwCfaI7O
1xYQhgrWg9SruNnxCzlL0Jg=
=eNw6
-----END PGP SIGNATURE-----

--==_Exmh_1317816559_4646P--
