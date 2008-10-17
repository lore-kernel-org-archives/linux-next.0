From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 17 Oct 2008 13:38:12 +0300
Message-ID: <20081017103811.GC11963@localhost.localdomain>
References: <20081017171350.bb82c42a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.29]:56258 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543AbYJQKgx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 06:36:53 -0400
Received: by yx-out-2324.google.com with SMTP id 8so93900yxm.1
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 03:36:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081017171350.bb82c42a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2008 at 05:13:50PM +1100, Stephen Rothwell wrote:
> Hi David,
>=20
> Today's linux-next merge of the creds tree got a conflict in
> include/linux/binfmts.h between commits
> 53112488bebe25c0f5f8a002470046c0fe9a6c61 ("alpha: introduce field 'taso'
> into struct linux_binprm") and bf2a9a39639b8b51377905397a5005f444e9a892
> ("Allow recursion in binfmt_script and binfmt_misc") from Linus' tree and
> commit e87a7f7a60e07326cd18987f1d490e42c083792c ("CRED: Make execve()
> take advantage of copy-on-write credentials") from the creds tree.
>=20
> Just context changes.  I fixed it up (see below).

Ack.

--=20
Regards,  Kirill A. Shutemov
 + Belarus, Minsk
 + ALT Linux Team, http://www.altlinux.com/

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj4axMACgkQbWYnhzC5v6o82ACeKg9mkNKYexTxBvkSfx0EUOrw
choAn29zdg0YKQ9Z95L4hqJYCMCusIlV
=EYV8
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
