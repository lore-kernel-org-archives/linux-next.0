From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the audit tree
Date: Thu, 11 Dec 2008 20:01:32 +1100
Message-ID: <20081211200132.4c466a99.sfr@canb.auug.org.au>
References: <1228935701.3524.3.camel@localhost.localdomain>
	<20081209175726.682d77cd.sfr@canb.auug.org.au>
	<13157.1228935509@redhat.com>
	<13530.1228937583@redhat.com>
	<20081211063138.GP28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_20_01_32_+1100_MK.L588PeYiUhvfY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48835 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753869AbYLKJBo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 04:01:44 -0500
In-Reply-To: <20081211063138.GP28946@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: David Howells <dhowells@redhat.com>, Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Serge Hallyn <serue@us.ibm.com>

--Signature=_Thu__11_Dec_2008_20_01_32_+1100_MK.L588PeYiUhvfY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Thu, 11 Dec 2008 06:31:38 +0000 Al Viro <viro@ZenIV.linux.org.uk> wrote:
>
> So at this point everything in that branch is taken care of.  I do have
> several more in a private queue, but those will need review and testing
> before they go into -next.

Easiest thing to do then is to make the for-linus and for-next branches
point into Linus' tree until you need them again.  That way you don't
need to let me know when to start (or stop) fetching them again - I just
fetch them every day and if there is something there it will get
integrated.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_20_01_32_+1100_MK.L588PeYiUhvfY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklA1uwACgkQjjKRsyhoI8z+/wCZAXT5KOEqc6ZAkRsYeIAIOMa4
adQAn07++zvUROJdo0TH1iBbWAfd6Ny1
=zKCj
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_20_01_32_+1100_MK.L588PeYiUhvfY--
