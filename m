From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Next April 28: boot failure on PowerPC with SLQB
Date: Fri, 1 May 2009 00:00:33 +1000
Message-ID: <20090501000033.ecce9ed8.sfr@canb.auug.org.au>
References: <49F87FAB.9050408@in.ibm.com>
	<20090430041146.GB23746@wotan.suse.de>
	<49F938E4.2030703@in.ibm.com>
	<20090430064127.GF23746@wotan.suse.de>
	<49F973A0.8070106@in.ibm.com>
	<20090430103528.GA6900@wotan.suse.de>
	<1241087884.19252.5.camel@penberg-laptop>
	<20090430210004.05a61841.sfr@canb.auug.org.au>
	<20090430111825.GC6900@wotan.suse.de>
	<1241090429.19252.7.camel@penberg-laptop>
	<20090430130542.GF6900@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_May_2009_00_00_33_+1000_b1.w3E9Nx9.XD32p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59686 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753117AbZD3OAk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 10:00:40 -0400
In-Reply-To: <20090430130542.GF6900@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Sachin Sant <sachinp@in.ibm.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Fri__1_May_2009_00_00_33_+1000_b1.w3E9Nx9.XD32p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Thu, 30 Apr 2009 15:05:42 +0200 Nick Piggin <npiggin@suse.de> wrote:
>
> Hmm, this might do it. The following code now passes some stress testing
> in a userspace harness wheras before it did not (and was obviously wrong).

Indeed that allows it to boot fine.  Thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_May_2009_00_00_33_+1000_b1.w3E9Nx9.XD32p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn5rwEACgkQjjKRsyhoI8woLQCdGwS2GUl8IbCKZM3gzyUPBLpX
kvQAoJjzbTKu9gu/pWQuzcGIQmqw4eSz
=DVrA
-----END PGP SIGNATURE-----

--Signature=_Fri__1_May_2009_00_00_33_+1000_b1.w3E9Nx9.XD32p--
